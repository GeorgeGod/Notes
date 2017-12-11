//
//  GPDatePicker.h
//  InnoSpace
//
//  Created by 虞嘉伟 on 2017/12/7.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPDatePicker;
@protocol GPDatePickerDelegate<NSObject>
@optional
- (void)datePicker:(GPDatePicker *)datePicker didSelectedRowAtIndex:(NSString *)dateStr;
@end


//PGDatePickerModeYear
//typedef NS_ENUM(NSInteger, GPDatePickerMode) {
//    GPDatePickerModeYear = 0,
//    GPDatePickerModeYearMonth,
//    
//    GPDatePickerModeYearMonthDay,
//    GPDatePickerModeYearMonthDayTime,
//};

@interface GPDatePicker : UIView

@property (weak, nonatomic) IBOutlet UIButton *background;
@property (weak, nonatomic) IBOutlet UIView *boardView;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *line;

@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

//选择的行号
@property (nonatomic, copy  ) void(^didSelectedRow)(GPDatePicker *datePicker, NSString *date);

/**
 dataArray装的可以是字符串，也可以是富文本字符串
 */
//@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, copy  ) NSString *dateFormat; //返回的时间格式 eg: @"yyyy年MM月dd日"

@property (nonatomic, weak  ) id<GPDatePickerDelegate>delegate;

+(instancetype)DatePicker;
+(instancetype)DatePickerWithTitle:(NSString *)title;
+(instancetype)DatePickerWithMode:(UIDatePickerMode)mode;

-(void)show;

@end
