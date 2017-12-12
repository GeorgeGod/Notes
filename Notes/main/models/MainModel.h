//
//  MainModel.h
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MainModel : NSObject

@property (nonatomic, copy  ) NSString *shopName;  //店名
@property (nonatomic, copy  ) NSString *customerName; //客户名
@property (nonatomic, copy  ) NSString *durationTime; //时间长
@property (nonatomic, copy  ) NSString *projectName; //项目名
@property (nonatomic, copy  ) NSString *parts; //部位
@property (nonatomic, copy  ) NSDate *beginDate; //开始日期
@property (nonatomic, copy  ) NSDate *endDate; //结束日期

@end
