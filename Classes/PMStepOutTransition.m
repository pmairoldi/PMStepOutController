//
//  CouponTransition.m
//  GamePrototype
//
//  Created by Pierre-Marc Airoldi on 2014-06-17.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#import "PMStepOutTransition.h"
#import "PMStepOutController.h"

#define SPRING_DAMPING 0.9
#define SPRING_VELOCITY 0.5
#define ANIMATION_DURATION 0.4

#define SNAPSHOT_TAG 1

@interface PMStepOutTransition ()

@end

@implementation PMStepOutTransition

- (id)init {
    
    self = [super init];
    
    if (self) {
        
        self.duration = ANIMATION_DURATION;
        self.reverse = NO;
    }
    
    return self;
}

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    return self.duration;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *toView = toVC.view;
    UIView *fromView = fromVC.view;
    
    [self animateTransition:transitionContext fromVC:fromVC toVC:toVC fromView:fromView toView:toView];
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext fromVC:(UIViewController *)fromVC toVC:(UIViewController *)toVC fromView:(UIView *)fromView toView:(UIView *)toView {
    
    UIView *containerView = [transitionContext containerView];
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    if (!_reverse) {
        
        UIGraphicsBeginImageContextWithOptions(fromView.bounds.size, NO, 0);
        
        [fromView drawViewHierarchyInRect:fromView.bounds afterScreenUpdates:YES];
        
        UIImage *snapshot = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:fromView.frame];
        imageView.image = snapshot;
        imageView.tag = SNAPSHOT_TAG;
        
        [fromView removeFromSuperview];
        
        [containerView addSubview:imageView];
        [containerView addSubview:toView];
        
        PMStepOutController *controller = (PMStepOutController *)toVC;
        
        [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:SPRING_DAMPING initialSpringVelocity:SPRING_VELOCITY options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            controller.presentedView.center = CGPointMake(CGRectGetMidX(toView.frame), CGRectGetMidY(toView.frame));
            
            imageView.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0);
            
            imageView.alpha = 0.5;
            
        } completion:^(BOOL finished) {
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
    }
    
    else {
        
        UIImageView *imageView = (UIImageView *)[containerView viewWithTag:SNAPSHOT_TAG];
        
        imageView.layer.transform = CATransform3DMakeScale(0.8, 0.8, 1.0);
        imageView.alpha = 0.5;
        
        CGRect finalFrame = fromView.frame;
        finalFrame.origin.y += 200;
                
        [UIView animateWithDuration:duration delay:0.0 usingSpringWithDamping:SPRING_DAMPING initialSpringVelocity:SPRING_VELOCITY options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            imageView.layer.transform = CATransform3DMakeScale(1.0, 1.0, 1.0);
            imageView.alpha = 1.0;
            
        } completion:^(BOOL finished) {
     
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
        }];
        
        [UIView animateWithDuration:1.5*duration delay:0.0 usingSpringWithDamping:SPRING_DAMPING initialSpringVelocity:SPRING_VELOCITY options:UIViewAnimationOptionCurveEaseOut animations:^{
            
            fromView.frame = finalFrame;
            fromView.alpha = 0.0;
            
        } completion:^(BOOL finished) {
            
        }];
    }
}

@end
