//
//  NTAddNoteController.m
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "NTAddNoteController.h"
#import "Extension.h"
#import "NTAddViewModel.h"
#import "MJExtension.h"
#import "Masonry.h"
#import "NTAddNoteCell.h"
#import "PropertyIO.h"

#import "MainModel.h"
@interface NTAddNoteController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray<NSArray<NTAddViewModel *> *> *dataArray;
    
    MainModel *mainModel;
    
    NSDate *beginDate;
    NSDate *endDate;
}
//@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) UIButton *saveBtn;
@end

@implementation NTAddNoteController
@synthesize saveBtn;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"新增📝";
    self.leftBarButtonItem([UIImage load:@"back_gray"]);
    
    mainModel = [MainModel new];
    beginDate = [NSDate date];
    endDate = [NSDate date];
}


-(void)rightBarButtonItemAction:(UIBarButtonItem *)rightBarButtonItem {
    NTAddNoteController *addCtrl = [NTAddNoteController new];
    [self pushViewCtrl:addCtrl];
}

-(void)initView {
    
    [super initView];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [saveBtn setTitle:@"保存" forState:UIControlStateNormal];
    [saveBtn setBackgroundColor:[UIColor blueColor]];
    [saveBtn addTarget:self action:@selector(saveButtonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:saveBtn];
}

-(void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    
    UIEdgeInsets insets = UIEdgeInsetsZero;
    if (@available(iOS 11.0, *)) {
        insets = self.view.safeAreaInsets;
    }
    [saveBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view).insets(insets);
        make.height.mas_equalTo(44);
    }];
}
-(void)saveButtonAction {
    if ([self checkSaveData]) {
        //保存数据吧
//        @property (nonatomic, copy  ) NSString *shopName;  //店名
//        @property (nonatomic, copy  ) NSString *customerName; //客户名
//        @property (nonatomic, copy  ) NSString *durationTime; //时间长
//        @property (nonatomic, copy  ) NSString *projectName; //项目名
//        @property (nonatomic, copy  ) NSString *parts; //部位
//        @property (nonatomic, copy  ) NSDate *beginDate; //开始日期
//        @property (nonatomic, copy  ) NSDate *endDate; //结束日期
        
//        mainModel.shopName = dataArray
        
        for (NSArray *arr in dataArray) {
            for (NTAddViewModel *model in arr) {
                NSString *title = model.title;
                if ([title isEqualToString:@"店名"]) {
                    mainModel.shopName = model.detail;
                } else if ([title isEqualToString:@"客户名称"]) {
                    mainModel.customerName = model.detail;
                } else if ([title isEqualToString:@"项目"]) {
                    mainModel.projectName = model.detail;
                } else if ([title isEqualToString:@"部位"]) {
                    mainModel.parts = model.detail;
                } else if ([title isEqualToString:@"开始时间"]) {
                    mainModel.beginDate = beginDate;
                } else {
                    mainModel.endDate = endDate;
                }
            }
        }
        NSMutableArray *temp = [NSMutableArray arrayWithArray:[PropertyIO readMainData]];
        NSDictionary *dic = [mainModel mj_JSONObject];
        [temp addObject:dic];
        BOOL result = [PropertyIO writeMainData:temp];
        
        if (result) {
            [self showAlertViewWithMessage:@"数据保存成功" complete:^{
                [self popViewController];
            }];
        } else {
            [self showAlertViewWithMessage:@"数据保存失败" complete:^{
                
            }];
        }
    } else {
        [self showAlertViewWithMessage:@"你还有数据没填完" complete:^{
            
        }];
    }
}

-(void)showAlertViewWithMessage:(NSString *)message complete:(void(^)(void))complete {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if (complete) {
            complete();
        }
    }];
    [alert addAction:sure];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)initData {
    dataArray = @[
                  @[
                      [NTAddViewModel ViewModel:@"店名" detail:@"" place:@"请输入"],
                      [NTAddViewModel ViewModel:@"客户名称" detail:@"" place:@"请输入"],
                      [NTAddViewModel ViewModel:@"项目" detail:@"" place:@"请选择"],
                      [NTAddViewModel ViewModel:@"部位" detail:@"" place:@"请选择"],
                      ],
                  
                  @[
                      [NTAddViewModel ViewModel:@"开始时间" detail:@"" place:@"请选择"],
                      [NTAddViewModel ViewModel:@"结束时间" detail:@"" place:@"请选择"],
                      ],
                  ];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return dataArray.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray[section].count;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section==0 ? 0.01 : 8;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [UIView ViewWithColor:@"#E5E5E5"];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NTAddNoteCell *cell = (NTAddNoteCell *)[tableView obtainXibCell:[NTAddNoteCell class]];
    
    [cell configCellWithData:dataArray[indexPath.section][indexPath.row]];
    
    [cell.detail addTarget:self action:@selector(textFieldDidChangedEditing:) forControlEvents:UIControlEventEditingChanged];
    
    return cell;
}

- (void)textFieldDidChangedEditing:(UITextField *)textField {
    NTAddNoteCell *cell = (NTAddNoteCell *)textField.superview.superview;
    
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    NTAddViewModel *model = dataArray[indexPath.section][indexPath.row];
    NSString *title = model.title;
    if ([title isEqualToString:@"店名"]) {
        model.detail = textField.text;
    } else if ([title isEqualToString:@"客户名称"]) {
        model.detail = textField.text;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    /*
     项目
     部位
     开始时间
     结束时间
     */
    NTAddViewModel *model = dataArray[indexPath.section][indexPath.row];
    NSString *title = model.title;
    if ([title isEqualToString:@"项目"]) {
        NSArray *arr = [PropertyIO readProjects];
        GPPickerView *picker = [GPPickerView PickerViewWithTitle:@"请选择项目"];
        picker.dataArray = arr;
        picker.didSelectedRow = ^(GPPickerView *pickerView, NSInteger index) {
            model.detail = arr[index];
            [self.tableView reloadData];
        };
        [picker show];
    } else if ([title isEqualToString:@"部位"]) {
        NSArray *arr = [PropertyIO readParts];
        GPPickerView *picker = [GPPickerView PickerViewWithTitle:@"请选择部位"];
        picker.dataArray = arr;
        picker.didSelectedRow = ^(GPPickerView *pickerView, NSInteger index) {
            model.detail = arr[index];
            [self.tableView reloadData];
        };
        [picker show];
    } else if ([title isEqualToString:@"开始时间"]) {
        GPDatePicker *picker = [GPDatePicker DatePickerWithTitle:title];
        picker.didSelectedDate= ^(GPDatePicker *datePicker, NSDate *date) {
            model.detail = [NSDate date2MonthDayHourMin:date];
            beginDate = date;
            [self.tableView reloadData];
        };
        [picker show];
    } else if ([title isEqualToString:@"结束时间"]) {
        GPDatePicker *picker = [GPDatePicker DatePickerWithTitle:title];
        picker.didSelectedDate= ^(GPDatePicker *datePicker, NSDate *date) {
            model.detail = [NSDate date2MonthDayHourMin:date];
            endDate = date;
            [self.tableView reloadData];
        };
        [picker show];
    } else {
        
    }
}

-(BOOL)checkSaveData {
    BOOL result = YES;
    for (NSArray *arr in dataArray) {
        for (NTAddViewModel *model in arr) {
            if (model.detail.length == 0) {
                result = NO;
                break;
            }
        }
    }
    return result;
}

@end
