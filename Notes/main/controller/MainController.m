//
//  MainController.m
//  Notes
//
//  Created by 虞嘉伟 on 2017/12/11.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MainController.h"
#import "Extension.h"
#import "MainCell.h"

@interface MainController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *dataArray;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainController

- (void)viewDidLoad {
    [super viewDidLoad];
    //每个80,共7个
    self.scrollView.contentSize = CGSizeMake(560, 0);
}

-(void)initView {
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
//    [self.view addSubview:self.tableView];
//    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(self.view);
//    }];
}

-(void)initData {
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainCell *cell = (MainCell *)[tableView obtainXibCell:[MainCell class]];
    
    return cell;
}

@end

