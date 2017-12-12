//
//  NTAddViewModel.h
//  Notes
//
//  Created by admin on 2017/12/12.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NTAddViewModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, strong) NSString *placeholder;
@property (nonatomic, assign) BOOL show;

+(instancetype)ViewModel:(NSString *)title detail:(NSString *)detail place:(NSString *)placeholder;
@end
