//
//  XWPlaceHolderView.h
//  rmxw
//
//  Created by QN_MENG_WORK on 16/12/7.
//  Copyright © 2016年 北京青牛科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,placeDirection) {
    placeDirectionLeft  = 0,
    placeDirectionRight = 1
};
@interface XWPlaceHolderView : UIView
@property (nonatomic,strong) UIImageView *placeholderImageView;
@property (nonatomic,strong) UILabel *placeHolder;
@property (nonatomic,copy) NSString *holderText;
@property (nonatomic,assign) placeDirection placeType;
@property (nonatomic,strong) UIImage *mainImage;
@property (nonatomic,strong) UIFont *holderFont;
-(instancetype)initWithFrame:(CGRect)frame andPlaceType:(placeDirection)placeType;
@end
