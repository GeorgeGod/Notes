//
//  MainCell.h
//  Notes
//
//  Created by 虞嘉伟 on 2017/12/11.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "BaseCell.h"
#import "MainModel.h"

@interface MainCell : BaseCell
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *customerName;
@property (weak, nonatomic) IBOutlet UILabel *durationTime;
@property (weak, nonatomic) IBOutlet UILabel *projectName;
@property (weak, nonatomic) IBOutlet UILabel *parts;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *time;

-(void)configCellWithData:(MainModel *)model;

@end
