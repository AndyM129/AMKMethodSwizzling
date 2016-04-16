//
//  UIViewController+AMKit.m
//  AMKitLab_5.1
//
//  Created by Andy__M on 15/11/20.
//  Copyright © 2015年 Andy__M. All rights reserved.
//

#import "UIViewController+AMKit.h"
#import "NSObject+AMKMethodSwizzling.h"

static const void *NSOBJECT_RUNTIME_PROPERTY_KEY_ViewWillAppearOrDisappearBlock = &NSOBJECT_RUNTIME_PROPERTY_KEY_ViewWillAppearOrDisappearBlock;
static const void *NSOBJECT_RUNTIME_PROPERTY_KEY_ViewDidAppearOrDisappearBlock = &NSOBJECT_RUNTIME_PROPERTY_KEY_ViewDidAppearOrDisappearBlock;

@implementation UIViewController (AMKit)

#pragma mark - Init

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [UIViewController amk_swizzleInstanceMethod:@selector(viewWillAppear:) with:@selector(am_viewWillAppear:)];
        [UIViewController amk_swizzleInstanceMethod:@selector(viewDidAppear:) with:@selector(am_viewDidAppear:)];
        [UIViewController amk_swizzleInstanceMethod:@selector(viewWillDisappear:) with:@selector(am_viewWillDisappear:)];
        [UIViewController amk_swizzleInstanceMethod:@selector(viewDidDisappear:) with:@selector(am_viewDidDisappear:)];
    });
}

#pragma mark - Propertys

- (void (^)(UIViewController * viewController, BOOL viewWillAppear))am_viewWillAppearOrDisappearBlock {
    return objc_getAssociatedObject(self, NSOBJECT_RUNTIME_PROPERTY_KEY_ViewWillAppearOrDisappearBlock);
}

- (void)am_setViewWillAppearOrDisappearBlock:(void (^)(UIViewController * viewController, BOOL viewWillAppear))viewWillAppearOrDisappearBlock {
    objc_setAssociatedObject(self, NSOBJECT_RUNTIME_PROPERTY_KEY_ViewWillAppearOrDisappearBlock, viewWillAppearOrDisappearBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void (^)(UIViewController * viewController, BOOL viewDidAppear))am_viewDidAppearOrDisappearBlock {
    return objc_getAssociatedObject(self, NSOBJECT_RUNTIME_PROPERTY_KEY_ViewDidAppearOrDisappearBlock);
}

- (void)am_setViewDidAppearOrDisappearBlock:(void (^)(UIViewController * viewController, BOOL viewDidAppear))viewDidAppearOrDisappearBlock {
    objc_setAssociatedObject(self, NSOBJECT_RUNTIME_PROPERTY_KEY_ViewDidAppearOrDisappearBlock, viewDidAppearOrDisappearBlock, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Life Circle

-(void)am_viewWillAppear:(BOOL)animated {
    [self am_viewWillAppear:animated];
    if (self.am_viewWillAppearOrDisappearBlock) self.am_viewWillAppearOrDisappearBlock(self, YES);
}

- (void)am_viewDidAppear:(BOOL)animated {
    [self am_viewDidAppear:animated];
    if (self.am_viewDidAppearOrDisappearBlock) self.am_viewDidAppearOrDisappearBlock(self, YES);
}

-(void)am_viewWillDisappear:(BOOL)animated {
    [self am_viewWillDisappear:animated];
    if (self.am_viewWillAppearOrDisappearBlock) self.am_viewWillAppearOrDisappearBlock(self, NO);
}

-(void)am_viewDidDisappear:(BOOL)animated {
    [self am_viewDidDisappear:animated];
    if (self.am_viewDidAppearOrDisappearBlock) self.am_viewDidAppearOrDisappearBlock(self, NO);
}

@end

