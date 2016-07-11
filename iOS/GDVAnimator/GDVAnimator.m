//
//  GDVAnimator.m
//  share1_test
//
//  Created by Jack on 11/07/16.
//  Copyright © 2016 Jack. All rights reserved.
//

#import "GDVAnimator.h"

@implementation GDVAnimator

-(void)viewDidLoad
{
    [super viewDidLoad];
    selectors = [[NSMutableArray alloc] init];
}
-(void)addSelector:(SEL)sel withDelay:(NSTimeInterval)delay
{
    NSMethodSignature *sig = [[self class] instanceMethodSignatureForSelector:sel];
    NSInvocation *inv = [NSInvocation invocationWithMethodSignature:sig];
    [inv setTarget:self];
    [inv setSelector:sel];
    
    NSNumber* num = [NSNumber numberWithDouble:delay];
    [selectors addObject:@[inv, num]];
}
-(void)startAnimator
{
    if (selectors.count == 0) return;
    
    NSArray* a = [selectors objectAtIndex:0];
    NSInvocation* invocation = a[0];
    NSTimeInterval delay = [a[1] floatValue];
    
    [self performSelector:invocation.selector withObject:nil afterDelay:delay];
    
    for(int i=1;i<selectors.count;i++)
    {
        NSArray* a = [selectors objectAtIndex:i];
        NSInvocation* invocation = a[0];
        delay += [a[1] floatValue];
        [self performSelector:invocation.selector withObject:nil afterDelay:delay];
    }
}

@end
