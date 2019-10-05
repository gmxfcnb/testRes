//
//  ViewController.m
//  as
//
//  Created by mason on 2019/6/17.
//  Copyright © 2019 mason. All rights reserved.
//

#import "ViewController.h"
#import <SDAutoLayout.h>
#import "UITableView+SDAutoTableViewCellHeight.h"
#import "PersonTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)NSMutableArray *modelArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.modelArray = [[NSMutableArray alloc]init];
    self.tabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    [self.view addSubview:self.tabView];
    
    self.tabView.sd_layout.topSpaceToView(self.view, 64).leftEqualToView(self.view).rightEqualToView(self.view).heightIs(700);
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
//    self.tabView.bounces=NO;
//    self.tabView.showsVerticalScrollIndicator=NO;
//    self.tabView.backgroundColor=[UIColor clearColor];
//    self.tabView.delegate=self;
//    self.tabView.dataSource=self;
    
    Person *bean=[Person new];
    bean.userName=@"测试1";
    bean.phone=@"13912345676";
    bean.address=@"简介：周杰伦（Jay Chou），1979年1月18日出生于台湾省新北市，华语流行男歌手、演员、词曲创作人、MV及电影导演、编剧及制作人。2000年被吴宗宪发掘，发行首张个人专辑《Jay》。2001年发行专辑《范特西》。2002年在中国、新加坡、马来西亚、美国等地举办首场个人世界巡回演唱会";
    
    Person *bean1=[Person new];
    bean1.userName=@"测试2";
    bean1.phone=@"13912345676";
    bean1.address=@"简介：许嵩，中国内地流行乐男歌手，音乐创作人，1986年5月14日生于安徽合肥，毕业于安徽医科大学。2009年独立出版首张词曲全创作专辑《自定义》；2010年出版第二张词曲全创作专辑《寻雾启示》；2011年加盟海蝶音乐，推出第三张词曲全创作专辑《苏格拉没有底》；2012年7月发表第四张全创作专辑《梦游计》；2013年8月出版个人摄影随笔集《海上灵光》；2014年8月推出第五张全创作专辑《不如吃茶去》。2016年4月发行第六张个人专辑《青年晚报》。";
    
    
    Person *bean2=[Person new];
    bean2.userName=@"测试3";
    bean2.phone=@"13912345676";
    bean2.address=@"简介：吴亦凡（Kris），1990年11月6日出生于广东省广州市，演员，歌手。2007年，吴亦凡通过S.M. GlobalAudition Canada加入了韩国SM娱乐公司，参加练习生培训。2012年作为EXO组合成员正式出道，并成为EXO-M队长。2014年5月15日，吴亦凡正式向首尔中央地方法院请求判决与SM娱乐公司“专属合同”无效。之后，吴亦凡回归中国国内，担任徐静蕾执导的电影《有一个地方只有我们知道》男主角，并于7月发行个人单曲《时间煮雨》；同年8月，电影《夏有乔木》确定由吴亦凡出演夏木；同年11月，发布个人参与创作的电影同名主题曲《有一个地方》。12月12日确定与冯小刚、张涵予等合作出演电影《老炮儿》。12月26日确定担任电影《致青春2原来你还在这里》男主角程铮。";
    
    Person *bean3=[Person new];
    bean3.userName=@"测试4";
    bean3.phone=@"13912345676";
    bean3.address=@"简介：校长，90后创作型艺人，对音乐有浓厚的兴趣 嗓音清澈高亢善于演绎多种演唱风格，并擅长创作多种形式音乐，以旋律性见长，在网络上歌声也赢得许多观众。";
    
    [self.modelArray addObject:bean];
    [self.modelArray addObject:bean1];
    [self.modelArray addObject:bean2];
    [self.modelArray addObject:bean3];

  

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)theTableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)theTableView numberOfRowsInSection:(NSInteger)section
{
    return self.modelArray.count;
}
#pragma cellForRowAtIndexPath
- (UITableViewCell *)tableView:(UITableView *)theTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = [NSString stringWithFormat:@"UserInfoTableViewCell%ld%ld", [indexPath section], [indexPath row]];//以indexPath来唯一确定cell
    PersonTableViewCell *cell = (PersonTableViewCell *)[theTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[PersonTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    
    cell.model = self.modelArray[indexPath.row];
    /** 启用cell frame缓存（可以提高cell滚动的流畅度, 目前为cell专用方法，后期会扩展到其他view） */
    [cell useCellFrameCacheWithIndexPath:indexPath tableView:self.tabView];
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tabView cellHeightForIndexPath:indexPath model:self.modelArray[indexPath.row] keyPath:@"model" cellClass:[PersonTableViewCell class] contentViewWidth:[self cellContentViewWith]];
}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}



//    - (void)createView {
//        NSArray *imgArray = @[@"ic_sz_ddsz",@"ic_sz_wmsz",@"ic_sz_xtsz",@"ic_sz_ddsz"];
//        NSArray *titleArray = @[@"店铺详情",@"外卖设置",@"系统设置",@"关于我们"];
//
//        UIView *contentView = [[UIView alloc] init];
//        contentView.backgroundColor = [UIColor brownColor];
//        [self.view addSubview:contentView];
//        contentView.sd_layout.leftEqualToView(self.view).topSpaceToView(self.view, 64).rightEqualToView(self.view);
//
//        NSMutableArray *viewArray = [[NSMutableArray alloc] init];
//        for (int i = 0; i < titleArray.count; i ++) {
//            UIView *inView = [[UIView alloc] init];
//            inView.backgroundColor = [UIColor whiteColor];
//            [contentView addSubview:inView];
//            // 自适应高度，传入高宽比值，label可以传0实现文字高度自适应
//            // inView.sd_layout.autoHeightRatio(50/375.f);
//            // 高度值，参数为“(CGFloat)”
//            inView.sd_layout.heightIs(50);
//
//            inView.backgroundColor = [UIColor lightGrayColor];
//
//            UIImageView *imgView = [[UIImageView alloc] init];
//            imgView.image = [UIImage imageNamed:imgArray[i]];
//            [inView addSubview:imgView];
//            imgView.sd_layout.leftSpaceToView(inView, 10).centerYEqualToView(inView).heightIs(imgView.image.size.height).widthIs(imgView.image.size.width);
//
//            UILabel *titleLabel = [[UILabel alloc] init];
//            [titleLabel setTextColor:[UIColor blackColor]];
//            [titleLabel setText:titleArray[i]];
//            [inView addSubview:titleLabel];
//            titleLabel.sd_layout.leftSpaceToView(imgView, 10).centerYEqualToView(inView).heightIs(20).rightSpaceToView(inView, 10);
//            titleLabel.backgroundColor  = [UIColor greenColor];
//            UIButton *button = [[UIButton alloc] init];
//            [button addTarget:self action:@selector(functionClick:) forControlEvents:UIControlEventTouchUpInside];
//
//            [button setTitle:@"" forState:UIControlStateNormal];
//            [button setImage:[UIImage imageNamed:@"btn_right_arrow"] forState:UIControlStateNormal];
//            [inView addSubview:button];
//            // heightRatioToView 高度是参照view高度的多少倍，参数为“(View, CGFloat)”
//            button.sd_layout.leftEqualToView(inView).topSpaceToView(inView, 0).rightEqualToView(inView).heightRatioToView(inView, 1);
//            button.titleLabel.sd_layout.leftSpaceToView(button, 10).centerYEqualToView(button).heightIs(20).rightSpaceToView(button, 100);
//            button.imageView.sd_layout.rightSpaceToView(button, 10).centerYEqualToView(button).heightIs(20).widthIs(20);
//
//            UIView *lineView = [[UIView alloc] init];
//            lineView.backgroundColor = [UIColor blueColor];
//            [inView addSubview:lineView];    lineView.sd_layout.leftEqualToView(inView).bottomSpaceToView(inView, 0).rightEqualToView(inView).heightIs(5);
//
//            [viewArray addObject:inView];
//        }
//        /**
//         * UIView 九宫格浮动布局效果
//         * 设置类似collectionView效果的固定间距自动宽度浮动子view
//         * viewsArray       : 需要浮动布局的所有视图
//         * perRowItemsCount : 每行显示的视图个数
//         * verticalMargin   : 视图之间的垂直间距
//         * horizontalMargin : 视图之间的水平间距
//         * vInset           : 上下缩进值
//         * hInset           : 左右缩进值
//         */
//        // 四行一列
//        // [contentView setupAutoWidthFlowItems:viewArray withPerRowItemsCount:1 verticalMargin:10 horizontalMargin:0 verticalEdgeInset:0 horizontalEdgeInset:0];
//        // 两行两列
//        [contentView setupAutoWidthFlowItems:viewArray withPerRowItemsCount:2 verticalMargin:10 horizontalMargin:10 verticalEdgeInset:0 horizontalEdgeInset:0];
//    }
//
//#pragma mark 设置对应响应事件
//
//    - (void)functionClick:(UIButton *)sender {
//        NSLog(@"%ld",sender.tag);
//        if (sender.tag == 0) {
//            // 店铺详情
//
//        } else if (sender.tag == 1) {
//            // 外卖设置
//            NSLog(@"%ld",sender.tag);
//
//        } else {
//            // 系统设置
//
//        }
//    }

@end
