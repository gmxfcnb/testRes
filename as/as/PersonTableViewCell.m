//
//  PersonTableViewCell.m
//  as
//
//  Created by mason on 2019/6/20.
//  Copyright © 2019 mason. All rights reserved.
//

#import "PersonTableViewCell.h"
#import <SDAutoLayout.h>
#import "Person.h"
@implementation PersonTableViewCell
-(void)setModel:(Person *)model
{
    _model = model;
    self.labelUserName.text=model.userName;
    self.labelPhone.text=model.phone;
    self.labelAddress.text=model.address;
    
    [self setupAutoHeightWithBottomView:self.labelAddress bottomMargin:10];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        //创建控件
        self.labelUserName=[UILabel new];
        self.labelPhone=[UILabel new];
        self.labelAddress=[UILabel new];
        
        
        //添加控件  这里必须要 self.contentView 如果是self 测试过无法高度适配
        [self.contentView sd_addSubviews:@[self.labelUserName,self.labelPhone,self.labelAddress]];
        self.labelUserName.font=[UIFont systemFontOfSize:16];
        
        self.labelPhone.font=[UIFont systemFontOfSize:16];
        
        self.labelAddress.font=[UIFont systemFontOfSize:16];
        
        //设置地址多行显示
        self.labelAddress.numberOfLines=0;
        
        
        //下面的self 要改为self.contentView 才有效果
        self.labelUserName.sd_layout.leftSpaceToView(self.contentView, 10).topSpaceToView(self.contentView,10).widthIs(80).heightIs(20);
        self.labelAddress.backgroundColor = [UIColor brownColor];
        self.labelPhone.sd_layout.rightSpaceToView(self.contentView, 20).topEqualToView(self.labelUserName).widthIs(120).heightIs(20);
        
        //autoHeightRatio(0) 设置自适应高度 这个很重要
        //setSingleLineAutoResizeWithMaxWidth 设置宽度自适应 我这里是 左边距
        //和用户名对齐 右边距离屏幕20
    self.labelAddress.sd_layout.leftEqualToView(self.labelUserName).topSpaceToView(self.labelUserName, 10).rightSpaceToView(self.contentView, 20).autoHeightRatio(0);
//                [self.labelAddress setSingleLineAutoResizeWithMaxWidth:500];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


@end
