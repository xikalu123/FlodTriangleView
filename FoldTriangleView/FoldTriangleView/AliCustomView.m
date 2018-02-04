//
//  AliCustomView.m
//  AliBabaVIew
//
//  Created by 陈宇亮 on 2018/2/1.
//  Copyright © 2018年 陈宇亮. All rights reserved.
//

#import "AliCustomView.h"

@interface AliCustomView()

@property (nonatomic, strong) AliCustomViewStyleConfig *config;
@property (nonatomic, strong) UILabel *textlabel;

@end

@implementation AliCustomView

- (instancetype)initWithFrame:(CGRect)frame styleConfig:(AliCustomViewStyleConfig *)styleConfig
{
    if (self = [super initWithFrame:frame]) {
        _config = styleConfig;
        [self setUpView];
    }
    return self;
}


- (void)setUpView
{
    CGRect frame = self.frame;
    frame.size = _config.viewSize;
    self.frame = frame;
    self.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0001f];
    [self foldBottomRightTriangle];
    [self addBorderLayer];
    
    _textlabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    _textlabel.text = _config.textString;
    _textlabel.numberOfLines = 0;
    _textlabel.textColor = [UIColor blackColor];
    [self addSubview:_textlabel];
}


- (void)foldBottomRightTriangle
{
    [self hideBottomRightTriangle];
    [self addBottomRightMirrorTriangle];
}

#pragma 隐藏右下角的三角

- (void)hideBottomRightTriangle
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0,0, self.bounds.size.width, self.bounds.size.height) cornerRadius:0] ;
    
    
    
    UIBezierPath *triangle = [self bottomRightTrianglePath];
    [path appendPath:triangle];
    [path setUsesEvenOddFillRule:YES];
    
    CAShapeLayer *backgroundLayer = [CAShapeLayer layer];
    backgroundLayer.path = path.CGPath;
    backgroundLayer.fillRule =kCAFillRuleEvenOdd;
    backgroundLayer.fillColor = _config.viewBgColor.CGColor;
    [self.layer addSublayer:backgroundLayer];
}

- (UIBezierPath *)bottomRightTrianglePath
{
    UIBezierPath *triangle = [self pathForTriangleWithPoints:@[[NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width, _config.trianglePointY)],
                                                               [NSValue valueWithCGPoint:CGPointMake(_config.trianglePointX, self.bounds.size.height)],
                                                               [NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width, self.bounds.size.height)]]];
    return triangle;
}

#pragma 绘制右下角三角的镜像三角

- (void)addBottomRightMirrorTriangle
{
    UIBezierPath *mirrorTriangle = [self bottomRightMirrorTrianglePath];
    CAShapeLayer *triangleLayer = [CAShapeLayer layer];
    triangleLayer.path = mirrorTriangle.CGPath;
    triangleLayer.fillRule =kCAFillRuleNonZero;
    triangleLayer.fillColor = _config.borderColor.CGColor;
    [self.layer addSublayer:triangleLayer];
}

- (UIBezierPath *)bottomRightMirrorTrianglePath
{
    UIBezierPath *mirrorTriangle = [self pathForTriangleWithPoints:@[[NSValue valueWithCGPoint:CGPointMake(self.bounds.size.width, _config.trianglePointY)],
                                                                     [NSValue valueWithCGPoint:CGPointMake(_config.trianglePointX, self.bounds.size.height)],
                                                                     [NSValue valueWithCGPoint:[self symmetryPointWithFold]]]];
    return mirrorTriangle;
}

- (CGPoint )symmetryPointWithFold
{
    CGFloat k = (_config.trianglePointY - self.bounds.size.height) /(self.bounds.size.width - _config.trianglePointX);
    CGFloat b = _config.trianglePointY - self.bounds.size.width * k;
    
    CGFloat y = (2 * self.bounds.size.width * k + self.bounds.size.height * k*k +2*b - self.bounds.size.height)/(k*k+1);
    CGFloat x = (self.bounds.size.height - y) *k + self.bounds.size.width;
    return  CGPointMake(x, y);
}

#pragma 绘制边框

- (void)addBorderLayer
{
    UIBezierPath *triangle = [self bottomRightTrianglePath];
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(0, 0)];
    [maskPath appendPath:triangle];
    [maskPath setUsesEvenOddFillRule:YES];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    CAShapeLayer *frameLayer = [CAShapeLayer layer];
    frameLayer.path = maskPath.CGPath;
    frameLayer.fillRule =kCAFillRuleEvenOdd;
    frameLayer.fillColor = nil;
    frameLayer.strokeColor = _config.borderColor.CGColor;
    frameLayer.lineWidth = _config.borderWidth;
    [self.layer  addSublayer:frameLayer];
}


- (UIBezierPath *)pathForTriangleWithPoints:(NSArray *)pointArray
{
    if (pointArray.count < 3) {
        return nil;
    }
    UIBezierPath *path = [[UIBezierPath alloc] init];
    CGPoint origin1 = [[pointArray objectAtIndex:0] CGPointValue];
    CGPoint origin2 = [[pointArray objectAtIndex:1] CGPointValue];
    CGPoint origin3 = [[pointArray objectAtIndex:2] CGPointValue];
    [path moveToPoint:origin1];
    [path addLineToPoint:origin2];
    [path addLineToPoint:origin3];
    [path closePath];
    
    return path;
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
