//
//  GPPickerView.m
//  demo2
//
//  Created by 虞嘉伟 on 2017/12/6.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "GPPickerView.h"
#import "Extension.h"

@interface GPPickerView()<UIPickerViewDelegate, UIPickerViewDataSource>
{
    NSInteger selectedRow;
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *boardViewBottomMargin;

@end

@implementation GPPickerView

-(void)awakeFromNib {
    [super awakeFromNib];
    NSLog(@"awakeFromNib方法");
}

+(instancetype)PickerView {
    GPPickerView *picker = [[[NSBundle mainBundle] loadNibNamed:@"GPPickerView" owner:self options:nil] lastObject];
    
    [picker.background addTarget:picker action:@selector(cancelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    picker.pickerView.delegate = picker;
    picker.pickerView.dataSource = picker;
    
    return picker;
}

+(instancetype)PickerViewWithTitle:(NSString *)title {
    GPPickerView *picker = [self PickerView];
    picker.title.text = title;
    return picker;
}

+(instancetype)PickerViewWithData:(NSArray *)data {
    GPPickerView *picker = [self PickerView];
    picker.dataArray = data;
    return picker;
}
- (IBAction)cancelButtonAction:(UIButton *)sender {
    [self dismiss];
}
- (IBAction)confirmButtonAction:(UIButton *)sender {
    NSLog(@"确定按钮呗点击");
    [self selectRow:selectedRow];
    [self dismiss];
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.dataArray.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 44;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
    UILabel *lab = [UILabel new];
    lab.font = [UIFont RegularFont:15];
    lab.textColor = [UIColor colorWithHexStr:@"#666666"];
    lab.textAlignment = NSTextAlignmentCenter;
    if ([self.dataArray[row] isKindOfClass:[NSAttributedString class]]) {
        lab.attributedText = self.dataArray[row];
    } else {
        lab.text = self.dataArray[row];
    }
    return lab;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {

    selectedRow = row;
}

-(void)selectRow:(NSInteger)index {
    if (self.didSelectedRow) {
        self.didSelectedRow(self, index);
    }
    if ([self.delegate respondsToSelector:@selector(pickerView:didSelectedRowAtIndex:)]) {
        [self.delegate pickerView:self didSelectedRowAtIndex:index];
    }
}

@end
