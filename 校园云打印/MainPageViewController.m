//
//  MainPageViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/24.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "MainPageViewController.h"
#import "LoginViewController.h"
#import "GraduatePaperViewController.h"

@interface MainPageViewController ()

@end

@implementation MainPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.view.tag ++;
    if (self.view.tag == 1) {
        LoginViewController *loginVC = [[LoginViewController alloc] initWithNibName:@"LoginViewController" bundle:nil];
        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:loginVC];
        navVC.navigationBar.hidden = YES;
        [self presentViewController:navVC animated:YES completion:^{
            
        }];
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


///actions
- (IBAction)didTapPaperBn:(UIButton *)sender {
    
    GraduatePaperViewController *vc = [[GraduatePaperViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (IBAction)didTapPassBn:(UIButton *)sender {
}

- (IBAction)didTapCET6Bn:(UIButton *)sender {
}

- (IBAction)didTapExamBn:(UIButton *)sender {
    
}

@end
