//
//  XWPlaceHolderView.m
//  rmxw
//
//  Created by QN_MENG_WORK on 16/12/7.
//  Copyright © 2016年 北京青牛科技有限公司. All rights reserved.
//

#import "XWPlaceHolderView.h"
//#import "XWNewsHelper.h"


#define placeHolderFont [XWNewsHelper sharedHelper].CELL_SMALL_ELE_FONT_SIZE
#define gapW 2
@interface XWPlaceHolderView ()
@property (nonatomic ,assign) CGFloat rectWidth;
@property (nonatomic ,assign) CGFloat rectheight;
@end

@implementation XWPlaceHolderView

-(instancetype)initWithFrame:(CGRect)frame andPlaceType:(placeDirection)placeType
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor grayColor];
        self.rectWidth = frame.size.width;
        self.rectheight = frame.size.height;
        self.placeType = placeType;
        [self initWithPlaceHolder];
    }
    return self;
}
-(void)initWithPlaceHolder
{
    if (self.placeType == placeDirectionLeft) {
        self.placeholderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _rectheight, _rectheight)];
        self.placeHolder = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(self.placeholderImageView.frame)+gapW, 0, _rectWidth-CGRectGetMaxX(self.placeholderImageView.frame)-gapW, _rectheight)];
        self.placeholderImageView.image = [UIImage imageNamed:@"comment_pen_icon"];
        self.placeHolder.textAlignment = NSTextAlignmentLeft;
    }else if (self.placeType == placeDirectionRight)
    {
        self.placeHolder = [[UILabel alloc]initWithFrame:CGRectMake(_rectWidth-50, 0, 50, _rectheight)];
        self.placeholderImageView = [[UIImageView alloc]initWithFrame:CGRectMake(self.placeHolder.frame.origin.x-_rectheight-gapW, 0, _rectheight, _rectheight)];
        self.placeholderImageView.image = [UIImage imageNamed:@"comment"];
        self.placeHolder.textAlignment = NSTextAlignmentRight;
    }
    
    [self addSubview:self.placeholderImageView];
    
//    self.placeHolder.backgroundColor = [UIColor orangeColor];
    self.placeHolder.text = @"写评论";
    self.placeHolder.font = [UIFont systemFontOfSize:placeHolderFont];
    self.holderFont = self.placeHolder.font;
    self.placeHolder.textColor = NewsListGrayTextColor;
    [self addSubview:self.placeHolder];
}
-(void)setHolderText:(NSString *)holderText
{
    _holderText = holderText;
    self.placeHolder.text = holderText;
    UIFont *ff = self.holderFont;
    CGSize size = [XWGlobalHelper calculateStringSize:holderText font:self.holderFont width:self.placeHolder.frame.size.width*16];
//    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.placeholderImageView.frame.size.width+size.width+gapW, self.frame.size.height);
    if (self.placeType == placeDirectionRight) {
        self.placeHolder.frame = CGRectMake(_rectWidth-size.width, 0, size.width, _rectheight);
        self.placeholderImageView.frame = CGRectMake(self.placeHolder.frame.origin.x-_rectheight-gapW, 0, _rectheight, _rectheight);
    }else{
       self.placeHolder.frame = CGRectMake(self.placeHolder.frame.origin.x, self.placeHolder.frame.origin.y, size.width, _rectheight);
    }
    
}
-(void)setMainImage:(UIImage *)mainImage
{
    _mainImage = mainImage;
    self.placeholderImageView.image = mainImage;
}
-(void)setHolderFont:(UIFont *)holderFont
{
    _holderFont = holderFont;
    self.placeHolder.font = holderFont;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
