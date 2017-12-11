//
//  BaseTableViewController.h
//  Tang
//
//  Created by admin on 2017/11/28.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BaseViewController.h"
#import "Masonry.h"
#import "Extension.h"

@interface BaseTableViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView * _Nullable tableView;

/**
 设置tableView的tableFooterView
 
 @param tableView tableView
 @return view及其子类对象
 */
-(nullable UIView *)tableFootView:(UITableView *_Nullable)tableView;

@end
