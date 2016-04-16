//
//  ViewController.m
//  AMKMethodSwizzlingDemo
//
//  Created by Andy__M on 16/4/16.
//  Copyright © 2016年 Andy__M. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+AMKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [NSString stringWithFormat:@"AMKMethodSwizzlingDemo %ld", self.navigationController.viewControllers.count];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:75/255.0 green:172/255.0 blue:238/255.0 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = self.navigationController.navigationBar.barTintColor;
    button.frame = CGRectMake(0, 0, 300, 30);
    button.center = self.view.center;
    [button setTitle:@"PUSH" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithWhite:1 alpha:0.7] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonDidClick:(UIButton *)sender {
    //  通过运行时给UIViewController添加2个block属性
    //  通过MethodSwizzling，替换系统的实现为自己的实现，并在合适的位置调用自己添加的block属性
    //  这样就可以在外部控制新创建的UIViewController在生命周期的4个方法中执行指定代码了
    //  这只是AMKMethodSwizzling的使用方式之一
    UIViewController *viewController = [[ViewController alloc] init];
    viewController.am_viewWillAppearOrDisappearBlock = ^(UIViewController * viewController, BOOL viewWillAppear){
        NSLog(@"%@ %@", viewController.title, viewWillAppear?@"viewWillAppear":@"viewWillDisappear");
    };
    viewController.am_viewDidAppearOrDisappearBlock = ^(UIViewController * viewController, BOOL viewDidAppear){
        NSLog(@"%@ %@", viewController.title, viewDidAppear?@"viewDidAppear":@"viewDidDisappear");
    };
    [self.navigationController pushViewController:viewController animated:YES];
    
    printf("\n\n\n");   //  空行
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
