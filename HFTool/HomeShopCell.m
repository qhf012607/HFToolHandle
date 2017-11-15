//
//  HomeRedCell.m
//  QCWL_SYT
//
//  Created by qhf on 2017/11/3.
//  Copyright © 2017年 qcwl. All rights reserved.
//

#import "HomeShopCell.h"
#import "Masonry.h"
#import "UITableViewCell+CellFunction.h"

@interface HomeShopCell()

@property(nonatomic, strong) UIImageView *imageShop;
@property(nonatomic, strong) UILabel *labName;
@property(nonatomic, strong) UILabel *labPrice;
@property(nonatomic, strong) UILabel *labCategory;
@property(nonatomic, strong) UILabel *labCity;
@property(nonatomic, strong) UILabel *labDistance;
@property(nonatomic, strong) CALayer *layerLine;
@property(nonatomic, strong) UIButton *presaleLable;
@property(nonatomic, strong) UIButton *outLable;
@property(nonatomic, strong) id model;
@end

@implementation HomeShopCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.backgroundColor = [UIColor redColor];
        [self initUI];
        [self masLayout];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)initUI{
    [self.contentView addSubview:self.imageShop];
    [self.contentView addSubview:self.labName];
    [self.contentView addSubview:self.labPrice];
    [self.contentView addSubview:self.labCategory];
    [self.contentView addSubview:self.labCity];
    [self.contentView addSubview:self.outLable];
    [self.contentView addSubview:self.presaleLable];
    [self.contentView addSubview:self.labDistance];
//    [self.contentView addLineLayer:CGRectMake(10, 91.5, ScreenWidth-20, 0.5) color:HexRGB(0xececec, 1)];
}

-  (void)masLayout{
    [self.imageShop mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.top.mas_equalTo(16);
        make.size.mas_equalTo(CGSizeMake(80, 60));
    }];
    [self.labName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageShop.mas_right).offset(10);
        make.top.equalTo(self.imageShop);
        make.height.mas_equalTo(16);
    }];
    [self.labPrice mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labName);
        make.height.mas_equalTo(12);
        make.centerY.equalTo(self.imageShop);
    }];
    [self.labCategory mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.labName);
        make.height.mas_equalTo(12);
        make.bottom.equalTo(self.imageShop);
        make.width.lessThanOrEqualTo(@76);
    }];
    [self.labCity mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.mas_equalTo(self.labCategory.mas_right).offset(10);
         make.height.mas_equalTo(12);
         make.bottom.equalTo(self.imageShop);
    }];
    [self.outLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageShop);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(16);
    }];
    [self.presaleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imageShop);
        make.right.equalTo(self.outLable.mas_left).offset(-10);
        make.width.mas_equalTo(30);
        make.height.mas_equalTo(16);
    make.right.equalTo(self.contentView.mas_right).offset(-10).priority(300);
    }];
    [self.labDistance mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imageShop);
        make.right.equalTo(self.contentView.mas_right).offset(-10);
        make.height.mas_equalTo(12);
    }];
}

- (void)inputDataObject:(id)object{
    
}

- (void)butClick:(UIButton*)sender{
    if (self.customCall) {
        self.customCall(self.model, sender.tag);
    }
}

+ (CGFloat)getCellHeight:(id)model{
    return 92;
}

- (UIImageView*)imageShop{
    if (!_imageShop) {
        _imageShop = [[UIImageView alloc]init];
        _imageShop.contentMode = UIViewContentModeScaleAspectFill;
        _imageShop.clipsToBounds = YES;
    }
    return _imageShop;
}

- (UILabel*)labName{
    if (!_labName) {
        _labName = [[UILabel alloc]init];
        _labName.font = [UIFont systemFontOfSize:16];
      //  _labName.textColor = HexRGB(0x1A191E, 1);
    }
    return _labName;
}

- (UILabel*)labPrice{
    if (!_labPrice) {
        _labPrice = [[UILabel alloc]init];
        _labPrice.font = [UIFont systemFontOfSize:12];
    //    _labPrice.textColor  = HexRGB(0x666666, 1);
    }
    return _labPrice;
}

- (UILabel*)labCategory{
    if (!_labCategory) {
        _labCategory = [[UILabel alloc]init];
        _labCategory.font = [UIFont systemFontOfSize:12];
     //   _labCategory.textColor = HexRGB(0x666666, 1);
        _labCategory.numberOfLines = 1;
    }
    return _labCategory;
}

- (UILabel*)labCity{
    if (!_labCity) {
        _labCity = [[UILabel alloc]init];
        _labCity.font = [UIFont systemFontOfSize:12];
//        _labCity.textColor  = HexRGB(0x666666, 1);
//        [_labCity addLineLayer:CGRectMake(-5, 1, 1, 10) color:HexRGB(0x666666, 1)];
    }
    return _labCity;
}

- (UIButton*)outLable{
    if (!_outLable) {
        _outLable = [[UIButton alloc]init];
        _outLable.layer.cornerRadius = 2;
        _outLable.layer.borderWidth = 1;
      //  _outLable.layer.borderColor = HexRGB(0xF96637, 1).CGColor;
        [_outLable setTitle:@"外卖" forState:UIControlStateNormal];
      //  [_outLable setTitleColor:HexRGB(0xF96637, 1) forState:UIControlStateNormal];
        _outLable.titleLabel.font = [UIFont systemFontOfSize:11];
        _outLable.tag = 0;
        [_outLable addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _outLable;
}

- (UIButton*)presaleLable{
    if (!_presaleLable) {
        _presaleLable = [[UIButton alloc]init];
        _presaleLable.layer.cornerRadius = 2;
        _presaleLable.layer.borderWidth = 1;
    //    _presaleLable.layer.borderColor = HexRGB(0xCDA76E, 1).CGColor;
        [_presaleLable setTitle:@"预订" forState:UIControlStateNormal];
  //forState:UIControlStateNormal];
        _presaleLable.titleLabel.font = [UIFont systemFontOfSize:11];
        _presaleLable.tag = 1;
        [_presaleLable addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _presaleLable;
}

- (UILabel*)labDistance{
    if (!_labDistance) {
        _labDistance = [[UILabel alloc]init];
   //     _labDistance.textColor = HexRGB(0x999999, 1);
        _labDistance.font = [UIFont systemFontOfSize:12];
    }
    return _labDistance;
}
@end
