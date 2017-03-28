//
//  PaperDetailViewController.m
//  校园云打印
//
//  Created by 武淅 段 on 2017/3/27.
//  Copyright © 2017年 武淅 段. All rights reserved.
//

#import "PaperDetailViewController.h"

@interface PaperDetailViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;
@property (weak, nonatomic) IBOutlet UITextField *countField;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@end

@implementation PaperDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"打印文件"];
    _countField.delegate = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stepperValueChanged:(UIStepper *)sender {
    
    _countField.text = [NSString stringWithFormat:@"%.0lf", sender.value];
}

- (IBAction)didTapTime:(UIButton *)sender {
    
    UIDatePicker *picker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH-80, 160)];
    [picker addTarget:self action:@selector(dateValueChanged:) forControlEvents:UIControlEventValueChanged];
    [picker setDatePickerMode:UIDatePickerModeDateAndTime];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"请选择日期" message:@"\n\n\n\n\n\n\n\n\n\n\n\n" preferredStyle:UIAlertControllerStyleAlert];
    [alert.view addSubview:picker];
    UIAlertAction *ok = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSDate *date = picker.date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MM-dd hh:mm"];
        self.timeLabel.text = [formatter stringFromDate:date];
    }];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:ok];
    [alert addAction:cancel];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (IBAction)didTapSbmitBn:(UIButton *)sender {
    
    [MBProgressHUD showMessag:@"正在打印中..." toView:self.view];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [MBProgressHUD hideHUDForView:self.view animated:YES];
        [MBProgressHUD showSuccess:@"打印成功" toView:[UIApplication sharedApplication].keyWindow];
        [self.navigationController popViewControllerAnimated:YES];
    });
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    NSString *text = textField.text;
    _stepper.value = text.doubleValue;
    
}

- (void)dateValueChanged:(UIDatePicker *)picker {
    
    NSDate *date = picker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM-dd hh:mm"];
    _timeLabel.text = [formatter stringFromDate:date];
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
