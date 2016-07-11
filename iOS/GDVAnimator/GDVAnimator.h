//
//  GDVAnimator.h
//  share1_test
//
//  Created by Jack on 11/07/16.
//  Copyright © 2016 Jack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GDVAnimator : UIViewController
{
    NSMutableArray* selectors;
}
-(void)addSelector:(SEL)sel withDelay:(NSTimeInterval)delay;
-(void)startAnimator;

@end
