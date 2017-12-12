//
//  NTAddViewModel.m
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import "NTAddViewModel.h"

@implementation NTAddViewModel

+(instancetype)ViewModel:(NSString *)title detail:(NSString *)detail place:(NSString *)placeholder {
    NTAddViewModel *model = [NTAddViewModel new];
    model.title =title;
    model.detail = detail;
    model.placeholder = placeholder;
    return model;
}
@end
