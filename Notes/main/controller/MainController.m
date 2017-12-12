//
//  MainController.m
//  Notes
//
//  Created by 虞嘉伟 on 2017/12/11.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "MainController.h"
#import "NTAddNoteController.h"
#import "NTSettingsController.h"

#import "Masonry.h"
#import "MJExtension.h"
#import "Extension.h"
#import "MainModel.h"
#import "MainCell.h"

#import "PropertyIO.h"

@interface MainController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray<MainModel *> *dataArray;
}
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIButton *addBtn;
@end

@implementation MainController
@synthesize addBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    //每个80,共7个
    self.scrollView.contentSize = CGSizeMake(560, 0);
    self.title = @"备忘录";
    self.rightBarButtonItem(@"设置");
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self initData];
}

-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem {
    NTSettingsController *settingsCtrl = [NTSettingsController new];
    [self pushViewCtrl:settingsCtrl];
}

-(void)initView {
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    [addBtn setBackgroundColor:[UIColor blueColor]];
    [addBtn addTarget:self action:@selector(addButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets insets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        insets = self.view.safeAreaInsets;
    }
    [addBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(insets);
        make.height.mas_equalTo(44);
    }];
}
-(void)addButtonAction {
    NTAddNoteController *addCtrl = [NTAddNoteController new];
    [self pushViewCtrl:addCtrl];
}

-(void)initData {
    
//    NSMutableArray *temp = [NSMutableArray array];
//    for (int i=0; i<10; i++) {
//        MainModel *model = [MainModel new];
//        model.shopName = @"阿里巴巴";
//        model.customerName = @"小王";
//        model.durationTime = @"2小时";
//        model.projectName = @"有礼俗";
//        model.parts = @"身体";
//        model.beginDate = [NSDate date];
//        model.endDate = [NSDate dateWithTimeIntervalSinceNow:-3600];
//        [temp addObject:model];
//    }
//    dataArray = temp;
    
    NSArray<NSDictionary *> *data = [PropertyIO readMainData];
    dataArray = [MainModel mj_objectArrayWithKeyValuesArray:data];
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.01;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView new];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    MainCell *cell = (MainCell *)[tableView obtainXibCell:[MainCell class]];
    
    [cell configCellWithData:dataArray[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end

