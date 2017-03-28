//
//  PrintViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/27.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "PrintViewController.h"
#import "PaperDetailViewController.h"

@interface PrintViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) UITableView *tableView1;
@property (nonatomic) UITableView *tableView2;
@property (nonatomic) UITableView *tableView3;
@property (nonatomic) UISegmentedControl *segment;

@property (nonatomic) NSArray *colleges;
@property (nonatomic) NSArray *majors;
@property (nonatomic) NSArray *lessons;
@property (nonatomic) NSString *colloge;
@property (nonatomic) NSString *major;
@property (nonatomic) NSString *lesson;

@end

@implementation PrintViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _colleges = @[@"航天学院", @"航空学院", @"航海学院", @"物理与材料学院", @"计算机学院", @"通信工程学院", @"软件学院", @"物理学院", @"机电学院", @"任意"];
    _majors = @[@"软件工程", @"计算机科学", @"通信工程", @"微电子学院", @"任意"];
    _lessons = @[@"计算机网络", @"操作系统原理", @"计算机网络", @"信号与系统", @"任意"];
    _segment = [[UISegmentedControl alloc] initWithItems:@[@"自助打印", @"我有资料", @"上传资料"]];
    self.navigationItem.titleView = _segment;
    [_segment addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    _segment.selectedSegmentIndex = 0;
    
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStyleGrouped];
    [_tableView1 setSeparatorInset:UIEdgeInsetsZero];
    [_tableView1 setLayoutMargins:UIEdgeInsetsZero];
    [_tableView1 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView1];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStyleGrouped];
    [_tableView2 setSeparatorInset:UIEdgeInsetsZero];
    [_tableView2 setLayoutMargins:UIEdgeInsetsZero];
    [_tableView2 registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.view addSubview:_tableView2];
    
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(0, 44, SCREEN_WIDTH, SCREEN_HEIGHT-44) style:UITableViewStyleGrouped];
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
    
    UIView *footer = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 150)];
    footer.backgroundColor = [UIColor clearColor];
    UIButton *submitBn = [[UIButton alloc] initWithFrame:CGRectMake(30, 60, SCREEN_WIDTH-60, 44)];
    submitBn.layerCornerRadius = 6;
    submitBn.clipsToBounds = YES;
    [submitBn addTarget:self action:@selector(didTapSubmitBn:) forControlEvents:UIControlEventTouchUpInside];
    [submitBn setBackgroundColor:[UIColor colorWithRGB:0xffffff]];
    [submitBn setTitle:@"提  交" forState:UIControlStateNormal];
    [submitBn setTitleColor:[UIColor colorWithRGB:0x666666] forState:UIControlStateNormal];
    [footer addSubview:submitBn];
    _tableView1.tableFooterView = footer;
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
    if (tableView == _tableView1) {
        return 3;
    } else if (tableView == _tableView2) {
        return 2;
    } else {
        return 1;
    }
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
    if (tableView == _tableView1) {
        switch (indexPath.row) {
            case 0:{
                [cell.textLabel setText: _colloge ? : @"请选择学院"];
            }
                break;
            case 1: {
                [cell.textLabel setText: _major ? : @"请选择专业"];
                
            }
                break;
            case 2: {
                
                [cell.textLabel setText: _lesson ? : @"请选择科目"];
                
            }
                break;
            default:
                break;
        }
    } else if (tableView == _tableView2) {
        switch (indexPath.row) {
            case 0:{
                [cell.textLabel setText: @"拍照上传"];
            }
                break;
            case 1: {
                [cell.textLabel setText: @"请选择文件"];
                
            }
                break;
           
            default:
                break;
        }
    } else {
        [cell.textLabel setText:@"请选择文件上传"];
    }
    
    [cell setSeparatorInset:UIEdgeInsetsZero];
    [cell setLayoutMargins:UIEdgeInsetsZero];
    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (tableView == _tableView1) {
        
        switch (indexPath.row) {
            case 0:{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择学院" message:nil preferredStyle:UIAlertControllerStyleAlert];
                for (NSString *item in _colleges) {
                    UIAlertAction *action = [UIAlertAction actionWithTitle:item style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        self.colloge = action.title;
                        [self.tableView1 reloadData];
                    }];
                    [alert addAction:action];
                }
                [self presentViewController:alert animated:YES completion:nil];
            }
                break;
            case 1:{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择专业" message:nil preferredStyle:UIAlertControllerStyleAlert];
                for (NSString *item in _majors) {
                    UIAlertAction *action = [UIAlertAction actionWithTitle:item style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        self.major = action.title;
                        [self.tableView1 reloadData];
                    }];
                    [alert addAction:action];
                }
                [self presentViewController:alert animated:YES completion:nil];

            }
                break;
            case 2:{
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择科目" message:nil preferredStyle:UIAlertControllerStyleAlert];
                for (NSString *item in _lessons) {
                    UIAlertAction *action = [UIAlertAction actionWithTitle:item style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                        self.lesson = action.title;
                        [self.tableView1 reloadData];
                    }];
                    [alert addAction:action];
                }
                [self presentViewController:alert animated:YES completion:nil];

            }
                break;
            default:
                break;
        }
    }
    
}

#pragma mark - actions

- (void)segmentValueChanged:(UISegmentedControl *)sender {
    
    _tableView1.hidden = sender.selectedSegmentIndex != 0;
    _tableView2.hidden = sender.selectedSegmentIndex != 1;
    _tableView3.hidden = sender.selectedSegmentIndex != 2;
}


- (void)didTapSubmitBn:(UIButton *)sender {
    
    PaperDetailViewController *vc = [[PaperDetailViewController alloc] initWithNibName:@"PaperDetailViewController" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
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
