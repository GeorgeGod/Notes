//
//  GPPickerView.h
//  demo2
//
//  Created by 虞嘉伟 on 2017/12/6.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPPickerView;
@protocol GPPickerViewDelegate<NSObject>
@optional
- (void)pickerView:(GPPickerView *)pickerView didSelectedRowAtIndex:(NSInteger)index;
@end



@interface GPPickerView : UIView
@property (weak, nonatomic) IBOutlet UIButton *background;
@property (weak, nonatomic) IBOutlet UIView *boardView;

@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIView *line;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;

//选择的行号
@property (nonatomic, copy  ) void(^didSelectedRow)(GPPickerView *pickerView, NSInteger index);

/**
 dataArray装的可以是字符串，也可以是富文本字符串
 */
@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, weak  ) id<GPPickerViewDelegate>delegate;

+(instancetype)PickerView;
+(instancetype)PickerViewWithTitle:(NSString *)title;
+(instancetype)PickerViewWithData:(NSArray *)data;

-(void)show;
@end
