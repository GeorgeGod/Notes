//
//  NTAddNoteCell.m
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "NTAddNoteCell.h"

@implementation NTAddNoteCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configCellWithData:(NTAddViewModel *)model {
    self.title.text = model.title;
    self.detail.text = model.detail;
    self.detail.placeholder = model.placeholder;
    self.detail.enabled = [model.placeholder isEqualToString:@"请输入"];
}

@end
