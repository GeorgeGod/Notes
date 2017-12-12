//
//  NTAddNoteCell.h
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "BaseCell.h"
#import "NTAddViewModel.h"

@interface NTAddNoteCell : BaseCell

@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UITextField *detail;

-(void)configCellWithData:(NTAddViewModel *)model;
@end
