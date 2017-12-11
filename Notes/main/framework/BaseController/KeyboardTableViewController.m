//
//  KeyboardTableViewController.m
//  InnoSpace
//
//  Created by admin on 2017/12/5.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import "KeyboardTableViewController.h"
#import "Masonry.h"

@interface KeyboardTableViewController ()

@end

@implementation KeyboardTableViewController

//override
-(void)initView {
    TPKeyboardAvoidingTableView *tb = [[TPKeyboardAvoidingTableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tb.delegate = self;
    tb.dataSource = self;
    [self.view addSubview:tb];
    self.tableView = tb;
    if ([self respondsToSelector:@selector(tableFootView:)]) {
        UIView *tableFootView = [self tableFootView:tb];
        self.tableView.tableFooterView = tableFootView;
    }
    [tb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return nil;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    return nil;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

//空方法,需要被子类实现
-(UIView *)tableFootView:(UITableView *)tableView { return nil; }

@end
