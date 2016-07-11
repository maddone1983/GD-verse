//
//  GDVCursor.h
//  share1_test
//
//  Created by Jack on 11/07/16.
//  Copyright © 2016 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDVCursor : UIView
{
    UIColor* cur_color_outline;
    UIColor* cur_color_bg;
    UIColor* cur_color_bg_clicked;
    CGFloat cur_w;
    CGFloat cur_h;    
}

-(instancetype)init;
-(instancetype)initWithSize:(CGSize)size;
-(void)setOutlineColor:(UIColor*)color;
-(void)setColor:(UIColor*)color;
-(void)setClickedColor:(UIColor*)color;
-(void)setSize:(CGSize)size;

-(void)moveTo:(CGFloat)x andY:(CGFloat)y withDuration:(NSTimeInterval)duration;
-(void)tap;
-(void)longTap;
-(void)longTapFor:(NSTimeInterval)duration;

@end
