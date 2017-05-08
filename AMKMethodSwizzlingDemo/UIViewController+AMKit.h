//
//  UIViewController+AMKit.h
//  AMKitLab_5.1
//
//  Created by Andy__M on 15/11/20.
//  Copyright © 2015年 Andy__M. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (AMKit)
@property(nonatomic, copy, setter=am_setViewWillAppearOrDisappearBlock:) void(^am_viewWillAppearOrDisappearBlock)(UIViewController * viewController, BOOL viewWillAppear); //!< viewWillAppearOrDisappear的回调
@property(nonatomic, copy, setter=am_setViewDidAppearOrDisappearBlock:) void(^am_viewDidAppearOrDisappearBlock)(UIViewController * viewController, BOOL viewDidAppear);   //!< viewDidAppearOrDisappear的回调
@end
