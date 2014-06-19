//
//  CouponTransition.h
//  GamePrototype
//
//  Created by Pierre-Marc Airoldi on 2014-06-17.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PMStepOutTransition : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL reverse;
@property (nonatomic, assign) NSTimeInterval duration;

-(void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView;

@end
