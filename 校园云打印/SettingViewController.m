//
//  SettingViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/28.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, SCREEN_HEIGHT-20) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [_tableView setSeparatorInset:UIEdgeInsetsZero];
    [_tableView setLayoutMargins:UIEdgeInsetsZero];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
    
}

#pragma mark - tableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            return 3;
            break;
        case 2:
            return 4;
            break;
        default:
            break;
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSString *text;
    UIImage *img;
    switch (indexPath.section) {
        case 0:{
            text = @"我的云打印";
            img = [UIImage imageNamed:@"mylike"];
        }
            break;
        case 1:{
            if(indexPath.row == 0){
                text = @"账号管理";
                img = [UIImage imageNamed:@"myfollow"];
            } else if (indexPath.row == 1){
                text = @"搜索我的记录";
                img = [UIImage imageNamed:@"search_friends"];

            }else {
                text = @"浏览记录";
                img = [UIImage imageNamed:@"invite_friends"];

            }
        }
            break;
        case 2:{
            if(indexPath.row == 0){
                text = @"设置";
                img = [UIImage imageNamed:@"setting_mor"];
            } else if (indexPath.row == 1){
                text = @"意见反馈";
                img = [UIImage imageNamed:@"feed_back"];
                
            } else if(indexPath.row == 2){
                text = @"检测更新";
                img = [UIImage imageNamed:@"update"];
                
            } else {
                text = @"关于";
                img = [UIImage imageNamed:@"about"];

            }
        }
            break;
        default:
            break;
    }
    
    cell.textLabel.text = text;
    cell.imageView.image = img;
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if(section == 0){
        return @"    更多";
    } else if (section == 1){
        return @"    我的设置";
    } else {
        return @"    我的客户端";
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
        
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
