//
//  UITableView+Extension.h
//  Tang
//
//  Created by 虞嘉伟 on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)

-(UITableViewCell *)obtainCell:(Class)clazz;
-(UITableViewCell *)obtainXibCell:(Class)clazz;

@end
