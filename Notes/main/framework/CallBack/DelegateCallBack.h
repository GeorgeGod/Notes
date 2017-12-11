//
//  DelegateCallBack.h
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DelegateCallBack <NSObject>

-(void)buttonClickedBackCtrlDelegate:(BaseViewController *)target withType:(int)type;

@end
