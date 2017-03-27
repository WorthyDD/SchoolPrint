//
//  RegistViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/25.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "RegistViewController.h"
#import "User.h"
#import "AccountManager.h"

@interface RegistViewController ()

@property (weak, nonatomic) IBOutlet UITextField *userIDField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSeg;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;



@end

@implementation RegistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}


- (IBAction)didTapRegistBn:(id)sender {
    
    NSString *userID = _userIDField.text;
    NSString *psw = _pwdField.text;
    NSString *name = _nameField.text;
    NSString *gender = _genderSeg.selectedSegmentIndex == 0 ? @"男" : @"女";
    NSString *age = _ageField.text;
    NSString *phone = _phoneField.text;
    
    if (userID.length == 0 ||
        psw.length == 0 ||
        name.length == 0 ||
        age.length == 0 ||
        phone.length == 0) {
        [self.view makeToast:@"请输入完整"];
        return;
    }
    
    if (![phone isValidPhoneNumber]) {
        [self.view makeToast:@"手机号格式不正确"];
        return;
    }
    
    User *user = [[User alloc] init];
    user.name = name;
    user.password = psw;
    user.gender = gender;
    user.age = age;
    user.phone = phone;
    
    [[AccountManager shareManager] registUser:user completion:^(BOOL success, NSString *errorMsg) {
        if (success) {
            Toast(@"注册成功！");
            [self.navigationController dismissViewControllerAnimated:YES completion:^{
                
            }];
        } else {
            Toast(errorMsg);
        }

    }];
}




@end
