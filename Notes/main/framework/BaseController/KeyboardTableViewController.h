//
//  KeyboardTableViewController.h
//  InnoSpace
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import "BaseViewController.h"
#import "TPKeyboardAvoidingTableView.h"

@interface KeyboardTableViewController : BaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) TPKeyboardAvoidingTableView * _Nullable tableView;

/**
 设置tableView的tableFooterView
 
 @param tableView tableView
 @return view及其子类对象
 */
-(nullable UIView *)tableFootView:(UITableView *_Nullable)tableView;

@end
