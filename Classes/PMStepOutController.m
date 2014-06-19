//
//  CouponViewController.m
//  GamePrototype
//
//  Created by Pierre-Marc Airoldi on 2014-03-10.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#ifdef DEBUG
#else
#define NSLog(s,...)
#endif

#import "PMStepOutController.h"
#import "PMStepOutTransition.h"
#import <UIView+Copy/UIView+Copy.h>

@interface PMStepOutController ()

@property UITapGestureRecognizer *tapGesture;
@property (nonatomic, copy) void (^viewTransitionBlock)(UIView *view);

@end

@implementation PMStepOutController

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        // Custom initialization
        
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss:)];
        _tapGesture.delegate = self;
        
        self.transitioningDelegate = self;
        self.modalPresentationStyle = UIModalPresentationCustom;
        self.modalPresentationCapturesStatusBarAppearance = YES;
        
        _viewTransitionBlock = nil;
    }
    
    return self;
}

-(instancetype)initWithView:(UIView *)view {

    self = [self init];
    
    if (self) {
        
        CGRect presentedViewFrame = view.frame;
        CGPoint presentedViewCenter = [view.superview convertPoint:view.center toView:nil];
        
        _presentedView = [[self class] copyView:view];
        
        _presentedView.frame = presentedViewFrame;
        _presentedView.center = presentedViewCenter;
    }
    
    return self;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor clearColor];
    
    [self.view addGestureRecognizer:_tapGesture];
    
    if (!_presentedView) {
        
        NSLog(@"You need to provide a view to present!");
    }
    
    [self.view addSubview:_presentedView];
}

-(void)viewWillAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    if (_viewTransitionBlock != nil) {
        _viewTransitionBlock(_presentedView);
    }
}

#pragma Status Bar Methods

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationFade;
}

-(void)dismiss:(UITapGestureRecognizer *)recognizer {

    [self.view removeGestureRecognizer:_tapGesture];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma Transitioning Delegate Methods

-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    
    PMStepOutTransition *transition = [[PMStepOutTransition alloc] init];
    transition.reverse = NO;
    
    return transition;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    
    PMStepOutTransition *transition = [[PMStepOutTransition alloc] init];
    transition.reverse = YES;
    
    return transition;
}

#pragma Copy View Methods
+(UIView *)copyView:(UIView *)originalView {
    
    return [originalView pm_copy];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Block Properties

-(void)setViewTransitionBlock:(void (^)(UIView *view))viewTransitionBlock {

    _viewTransitionBlock = viewTransitionBlock;
}

@end
