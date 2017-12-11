//
//  GPDatePicker.m
//  InnoSpace
//
//  Created by 虞嘉伟 on 2017/12/7.
//  Copyright © 2017年 zfd. All rights reserved.
//  https://github.com/xiaozhuxiong121/PGDatePicker

#import "GPDatePicker.h"
#import "Extension.h"

@interface GPDatePicker()
{
    NSString *selectedDate;
}

@end

@implementation GPDatePicker

-(void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib方法");
}

+(instancetype)DatePicker {
    GPDatePicker *picker = [[[NSBundle mainBundle] loadNibNamed:@"GPDatePicker" owner:self options:nil] lastObject];
    
    //@"yyyy年MM月dd日(EEEE)
    picker.dateFormat = @"yyyy年MM月dd日";
    
    [picker.background addTarget:picker action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置一下默认选择时间为当前时间
    [picker dateChanged:picker.datePicker];
    
    //重点：UIControlEventValueChanged
    [picker.datePicker addTarget:picker action:@selector(dateChanged:) forControlEvents:UIControlEventValueChanged ];
    return picker;
}

+(instancetype)DatePickerWithTitle:(NSString *)title {
    GPDatePicker *picker = [self DatePicker];
    picker.title.text = title;
    return picker;
}
+(instancetype)DatePickerWithMode:(UIDatePickerMode)mode {
    GPDatePicker *picker = [self DatePicker];
    picker.datePicker.datePickerMode = mode;
    return picker;
}
- (IBAction)cancelButtonAction:(UIButton *)sender {
    [self dismiss];
}
- (IBAction)confirmButtonAction:(UIButton *)sender {
    NSLog(@"确定按钮呗点击");
    [self selectRow:selectedDate];
    [self dismiss];
}

-(void)setDateFormat:(NSString *)dateFormat {
    _dateFormat = dateFormat;
    [self dateChanged:self.datePicker];
}

-(void)show {
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    //平移动画
    float y = self.boardView.y;
    self.boardView.y = self.height;
    self.background.alpha = 0;
    
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.boardView.y = y;
        self.background.alpha = 0.5;
    } completion:^(BOOL finished) { }];
}
-(void)dismiss {
    //平移动画
    [UIView animateWithDuration:0.25 delay:0 usingSpringWithDamping:0.9 initialSpringVelocity:5 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.boardView.y = self.height;
        self.background.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


-(void)dateChanged:(id)sender{
    UIDatePicker *control = (UIDatePicker*)sender;
    NSDate* date = control.date;
    //添加你自己响应代码
    NSLog(@"dateChanged响应事件：%@",date);
    
    //NSDate格式转换为NSString格式
    NSDate *pickerDate = [self.datePicker date];// 获取用户通过UIDatePicker设置的日期和时间
    NSDateFormatter *pickerFormatter = [[NSDateFormatter alloc] init];// 创建一个日期格式器
    [pickerFormatter setDateFormat:_dateFormat];
    NSString *dateString = [pickerFormatter stringFromDate:pickerDate];
    
    //打印显示日期时间
    NSLog(@"格式化显示时间：%@",dateString);
    selectedDate = dateString;
}

-(void)selectRow:(NSString *)dateStr {
    if (self.didSelectedRow) {
        self.didSelectedRow(self, dateStr);
    }
    if ([self.delegate respondsToSelector:@selector(datePicker:didSelectedRowAtIndex:)]) {
        [self.delegate datePicker:self didSelectedRowAtIndex:dateStr];
    }
}

@end
