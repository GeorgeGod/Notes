//
//  MainCell.m
//  Notes
//
//  Created by 虞嘉伟 on 2017/12/11.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MainCell.h"
#import "Extension.h"

@implementation MainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configCellWithData:(MainModel *)model {
    self.shopName.text = model.shopName;
    self.customerName.text = model.customerName;
    self.durationTime.text = [NSDate date2Duration:model.beginDate to:model.endDate]; //计算得到的
    self.projectName.text = model.projectName;
    self.parts.text = model.parts;
    self.date.text = [NSDate date2MonthDay:model.beginDate]; //计算得到的
    self.time.text = [NSDate date2Interval:model.beginDate to:model.endDate]; //计算得到的
}

@end
