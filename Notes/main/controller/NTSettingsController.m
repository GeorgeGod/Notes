//
//  NTSettingsController.m
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "NTSettingsController.h"
#import "Extension.h"

@interface NTSettingsController ()

@end

@implementation NTSettingsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    
    UILabel *lab = [UILabel new];
    lab.text = @"未完待续";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.frame = self.view.bounds;
    [self.view addSubview:lab];
}

-(void)initView {
    [super initView];
    self.tableView.backgroundColor = [UIColor whiteColor];
}

@end
