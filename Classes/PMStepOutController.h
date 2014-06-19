//
//  CouponViewController.h
//  GamePrototype
//
//  Created by Pierre-Marc Airoldi on 2014-03-10.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PMStepOutController : UIViewController <UIGestureRecognizerDelegate, UIViewControllerTransitioningDelegate>

@property UIView *presentedView;

-(instancetype)initWithView:(UIView *)view;

+(UIView *)copyView:(UIView *)view;
-(void)setViewTransitionBlock:(void (^)(UIView *view))viewTransitionBlock;

@end
