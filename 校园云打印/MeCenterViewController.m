//
//  MeCenterViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/28.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "MeCenterViewController.h"
#import "AccountManager.h"

@interface MeCenterViewController ()

@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIView *detailView;
@property (weak, nonatomic) IBOutlet UITextField *collegeNameField;
@property (weak, nonatomic) IBOutlet UITextField *gradeField;
@property (weak, nonatomic) IBOutlet UITextField *roomField;
@property (weak, nonatomic) IBOutlet UITextField *strengthClassField;
@property (weak, nonatomic) IBOutlet UITextField *weakClassFeild;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;


@end

@implementation MeCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _segmentControl.selectedSegmentIndex = 0;
    [self updateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateView {
    
    User *currentUser = [AccountManager shareManager].currentUser;
    if (!currentUser) {
        return;
    }
    
    NSString *userID = currentUser.userID;
//    NSString *pwd = currentUser.password;
    NSString *name = currentUser.name;
    NSString *age = currentUser.age;
    NSString *gender = currentUser.gender;
    NSString *phone = currentUser.phone;
    NSString *content = [NSString stringWithFormat:@"用户名：%@\n\n密  码：***\n\n姓  名：%@\n\n年  龄：%@\n\n性  别：%@\n\n电  话：%@\n\n", userID, name, age, gender, phone];
    [_contentLabel setText:content];
}
- (IBAction)handleTapSaveInfo:(UIButton *)sender {
    
    [MBProgressHUD showSuccess:@"保存成功" toView:self.view];
}


- (IBAction)segmentControlValueChanged:(UISegmentedControl *)sender {
    
    _contentLabel.hidden = sender.selectedSegmentIndex != 0;
    _detailView.hidden = sender.selectedSegmentIndex != 1;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
