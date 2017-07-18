//
//  TrundleLabel.h
//  TrundleLabel
//
//  Created by QN_MENG_WORK on 16/1/20.
//  Copyright © 2016年 QN_MENG_WORK. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TrundleLabel : UIView
@property (nonatomic,copy) NSString *truTitle;
@property (nonatomic,copy) UIFont *font;
@property (nonatomic,copy) UIColor *textColor;
-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title;
-(void)moveStart;
-(void)moveStop;
-(void)moveRestart;
@end
