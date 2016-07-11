//
//  GDVCursor.m
//  share1_test
//
//  Created by Jack on 11/07/16.
//  Copyright © 2016 Jack. All rights reserved.
//

#import "GDVCursor.h"

@implementation GDVCursor

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        cur_color_bg = [UIColor colorWithWhite:0.8 alpha:0.4];
        cur_color_outline = [UIColor colorWithWhite:0.8 alpha:1];
        cur_color_bg_clicked = [UIColor colorWithWhite:0.8 alpha:0.8];
        cur_w = frame.size.width;
        cur_h = frame.size.height;
        [self redraw];
    }
    return self;
}
-(instancetype)init
{
    return [self initWithFrame:CGRectMake(0 ,0, 48, 48)];
}
-(instancetype)initWithSize:(CGSize)size
{
    return [self initWithFrame:CGRectMake(0 ,0, size.width, size.height)];
}


-(void)setOutlineColor:(UIColor*)c { cur_color_outline = c; [self redraw]; }
-(void)setColor:(UIColor*)c { cur_color_bg = c; [self redraw];}
-(void)setClickedColor:(UIColor*)c { cur_color_bg_clicked = c; [self redraw];}

-(void)setSize:(CGSize)size
{
    cur_w = size.width;
    cur_h = size.height;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, cur_w, cur_h);
    [self redraw];
}




-(void)redraw
{
    if (self.layer.sublayers.count > 1)
    {
        CAShapeLayer* lay = (CAShapeLayer*)[self.layer.sublayers objectAtIndex:0];
        [lay removeFromSuperlayer];
    }
    [self circleFilledWithFillColor:cur_color_bg outlineColor:cur_color_outline];
}
-(void)circleFilledWithFillColor:(UIColor*)fillColor outlineColor:(UIColor*)outlinecolor
{
    CGFloat l_width = 2.0f;
    CAShapeLayer *circleLayer = [CAShapeLayer layer];
    float width = self.frame.size.width;
    float height = self.frame.size.height;
    [circleLayer setBounds:CGRectMake(l_width, l_width, width-l_width, height-l_width)];
    [circleLayer setPosition:CGPointMake(width/2, height/2)];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(l_width, l_width, width-l_width, height-l_width)];
    [circleLayer setPath:[path CGPath]];
    [circleLayer setFillColor:fillColor.CGColor];
    [circleLayer setStrokeColor:outlinecolor.CGColor];
    [circleLayer setLineWidth:l_width];
    [[self layer] addSublayer:circleLayer];
}
-(void)moveTo:(CGFloat)x andY:(CGFloat)y withDuration:(NSTimeInterval)dur
{
    [UIView animateWithDuration:dur
                          delay:0.06
                        options: UIViewAnimationOptionCurveLinear
                     animations:^{
                         self.frame = CGRectMake(x, y, self.frame.size.width, self.frame.size.height);
                     }
                     completion:^(BOOL finished){
                     }];
}
-(void)unclickCursor
{
    CAShapeLayer* lay = (CAShapeLayer*)[self.layer.sublayers objectAtIndex:0];
    [lay setFillColor:cur_color_bg.CGColor];
}
-(void)clickWithDuration:(NSTimeInterval)duration
{
    CAShapeLayer* lay = (CAShapeLayer*)[self.layer.sublayers objectAtIndex:0];
    [lay setFillColor:cur_color_bg_clicked.CGColor];
    [self performSelector:@selector(unclickCursor) withObject:nil afterDelay:0.2];
}
-(void)tap { [self clickWithDuration:0.2]; }
-(void)longTap { [self clickWithDuration:1.0]; }
-(void)longTapFor:(NSTimeInterval)duration { [self clickWithDuration:duration]; }







/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
