//
//  TrundleLabel.m
//  TrundleLabel
//
//  Created by QN_MENG_WORK on 16/1/20.
//  Copyright © 2016年 QN_MENG_WORK. All rights reserved.
//

#import "TrundleLabel.h"

#define systemFont 22
#define trundleWid self.frame.size.width
#define trundleHei self.frame.size.height
@interface TrundleLabel ()
@property(nonatomic ,copy)   NSString *title;
@property(nonatomic ,strong) UILabel *truLabel;
@property(nonatomic ,assign) CGSize textSize;
@property(nonatomic ,strong) NSTimer *truTimer;
@end

@implementation TrundleLabel

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        _font = [UIFont systemFontOfSize:systemFont];
        [self.truTimer setFireDate:[NSDate distantFuture]];
    }
    return self;
}
-(instancetype)initWithFrame:(CGRect)frame andTitle:(NSString *)title
{
    self = [super initWithFrame:frame];
    if (self) {
        _title = title;
        self.clipsToBounds = YES;
        _font = [UIFont systemFontOfSize:systemFont];
        [self.truTimer setFireDate:[NSDate distantFuture]];
        [self setTruTitle:_title];
    }
    return self;
}
-(void)setTruTitle:(NSString *)truTitle
{
    _title = truTitle;
    _textSize = [truTitle boundingRectWithSize:CGSizeMake(9999, trundleHei)
                                       options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:@{ NSFontAttributeName: _font}
                                       context:nil].size;
    CGFloat truLabWidth = trundleWid;
    CGFloat truLabX = trundleWid;
    if (_textSize.width>trundleWid) {
        truLabWidth = _textSize.width;
        [self.truTimer setFireDate:[NSDate distantPast]];
    }else{
        truLabX = 0;
        [self.truTimer setFireDate:[NSDate distantFuture]];
    }
    [self removeTruLabel];
    self.truLabel.textColor = _textColor;
    self.truLabel.text = _title;
    self.truLabel.frame = CGRectMake(truLabX, 0, truLabWidth, trundleHei);
    [self addSubview:self.truLabel];
}
-(UILabel *)truLabel
{
    if (!_truLabel) {
        _truLabel = [[UILabel alloc]init];
        _truLabel.frame = CGRectMake(0, 0, trundleWid, trundleHei);
        _truLabel.font = _font;
        _truLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _truLabel;
}
-(void)setFont:(UIFont *)font
{
    _font = font;
    _truLabel.font = font;
    [self setTruTitle:_title];
}
-(void)setTextColor:(UIColor *)textColor
{
    _textColor = textColor;
    _truLabel.textColor = textColor;
}
-(NSTimer *)truTimer
{
    if (!_truTimer) {
        _truTimer = [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    }
    return _truTimer;
}
-(void)timerAction:(NSTimer *)timer
{
    int xx = _truLabel.frame.origin.x;
    if (xx<-_textSize.width) {
        xx = trundleWid;
    }
    _truLabel.frame = CGRectMake(xx-1, _truLabel.frame.origin.y, _truLabel.frame.size.width, _truLabel.frame.size.height);
}
-(void)removeTruLabel
{
    [_truLabel removeFromSuperview];
    _truLabel = nil;
}
-(void)moveStart
{
    [self.truTimer setFireDate:[NSDate distantPast]];
}
-(void)moveStop
{
    [self.truTimer setFireDate:[NSDate distantFuture]];
}
-(void)moveRestart
{
    [self removeTruLabel];
    [_truTimer invalidate];
    _truTimer = nil;
    [self setTruTitle:_title];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
