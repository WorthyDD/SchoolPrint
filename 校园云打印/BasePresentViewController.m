//
//  BasePresentViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/24.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "BasePresentViewController.h"

@interface BasePresentViewController ()

@end

@implementation BasePresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDismiss:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}



- (BOOL)resignFirstResponder {
    
    [self resignOnView:self.view];
    return YES;
}

- (void)resignOnView:(UIView *)view {
    for (UIView *v in view.subviews) {
        if ([v isKindOfClass:[UITextField class]] ||
            [v isKindOfClass:[UITextView class]]) {
            [v resignFirstResponder];
        } else if (v.subviews.count > 0) {
            [self resignOnView:v];
        }
    }
}

#pragma mark - keyboard

- (void)keyboardWillShow:(NSNotification *)noti {
    
    self.view.y = -80;
}

- (void)keyboardWillDismiss:(NSNotification *)noti {
    self.view.y = 0;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self resignFirstResponder];
}
@end
