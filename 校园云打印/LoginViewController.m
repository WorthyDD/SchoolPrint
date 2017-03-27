//
//  LoginViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/24.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "LoginViewController.h"
#import "AccountManager.h"
#import "RegistViewController.h"

@interface LoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userIDField;
@property (weak, nonatomic) IBOutlet UITextField *pswField;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *rememberButton;
@property (weak, nonatomic) IBOutlet UIButton *registButton;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - actions

- (IBAction)handleLogin:(id)sender {
    
    NSString *userID = _userIDField.text;
    NSString *password = _pswField.text;
    
    if (userID.length == 0 || password.length == 0) {
        Toast(@"账号或密码不能为空!");
        return;
    }
    
    if ([[AccountManager shareManager] vertifyUsername:userID password:password]) {
        Toast(@"登录成功！");
        [self.navigationController dismissViewControllerAnimated:YES completion:^{
            
        }];
    } else {
//        [self.view makeToast:@"账号或密码错误！"];
        Toast(@"账号或密码错误！");
    }
    
}

- (IBAction)handleRemberID:(id)sender {
    
    
}

- (IBAction)handleRegist:(id)sender {
    
    RegistViewController *vc = [[RegistViewController alloc] initWithNibName:@"RegistViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end
