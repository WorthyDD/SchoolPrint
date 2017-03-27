//
//  GraduatePaperViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/26.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "GraduatePaperViewController.h"

@interface GraduatePaperViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic) UITableView *tableView;

@end

@implementation GraduatePaperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    [self setTitle:@"毕业论文"];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView setLayoutMargins:UIEdgeInsetsZero];
    [_tableView setSeparatorInset:UIEdgeInsetsZero];
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self setAutomaticallyAdjustsScrollViewInsets:YES];
    
    UIImageView *header = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    [header setImage:[UIImage imageNamed:@"biye"]];
    [header setContentMode:UIViewContentModeScaleAspectFill];
    header.clipsToBounds = YES;
    self.tableView.tableHeaderView = header;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:{
            [cell.imageView setImage:[UIImage imageNamed:@"myfollow"]];
            [cell.textLabel setText:@"论文打印 限时特价"];
        }
            break;
        case 1: {
            [cell.imageView setImage:[UIImage imageNamed:@"search_friends"]];
            [cell.textLabel setText:@"给学弟学妹一些建议吧"];

        }
            break;
        case 2: {
            [cell.imageView setImage:[UIImage imageNamed:@"invite_friends"]];
            [cell.textLabel setText:@"贡献我的复习资料"];
            
        }
            break;
        default:
            break;
    }
    
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
