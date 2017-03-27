//
//  PrintViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/27.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "PrintViewController.h"

@interface PrintViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView1;
@property (nonatomic) UITableView *tableView2;
@property (nonatomic) UITableView *tableView3;
@property (nonatomic) UISegmentedControl *segment;

@end

@implementation PrintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"自助打印", @"我有资料", @"上传资料"]];
    self.navigationItem.titleView = _segment;
    [_segment addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    _segment.selectedSegmentIndex = 0;
    
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    [_tableView1 setSeparatorInset:UIEdgeInsetsZero];
    [_tableView1 setLayoutMargins:UIEdgeInsetsZero];
    [_tableView1 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView1];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    [_tableView2 setSeparatorInset:UIEdgeInsetsZero];
    [_tableView2 setLayoutMargins:UIEdgeInsetsZero];
    [_tableView2 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView2];
    
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
    [_tableView3 setSeparatorInset:UIEdgeInsetsZero];
    [_tableView3 setLayoutMargins:UIEdgeInsetsZero];
    [_tableView3 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView3];
    
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    
    _tableView1.hidden = NO;
    _tableView2.hidden = YES;
    _tableView3.hidden = YES;
    [self setAutomaticallyAdjustsScrollViewInsets:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - tableView

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

#pragma mark - actions

- (void)segmentValueChanged:(UISegmentedControl *)sender {
    
    _tableView1.hidden = sender.selectedSegmentIndex != 0;
    _tableView2.hidden = sender.selectedSegmentIndex != 1;
    _tableView3.hidden = sender.selectedSegmentIndex != 2;
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
