//
//  BlockCallBack.h
//  Tang
//
//  Created by admin on 2017/11/29.
//  Copyright © 2017年 虞嘉伟. All rights reserved.
//

#ifndef BlockCallBack_h
#define BlockCallBack_h

#import "BaseViewController.h"

//typedef NSString *(^VIPButtonCallBack)(id);
typedef void(^VIPButtonCallBack)(id obj);



/**
 按钮的点击事件回掉

 @param btn 按钮
 */
typedef void(^ButtonClickedCallBack)(UIButton *btn);


/**
 点击按钮先退出当前控制器，再做其他操作

 @param target 即将退出的控制器
 @param type 按钮的类型
 */
typedef void(^ButtonClickedBackCtrlCallBack)(BaseViewController *target, int type);



/**
 网络请求成功的回调

 @param json 返回字典对象
 */
typedef void(^successBlock)(NSDictionary * _Nullable json);

/**
 网络请求失败的回调

 @param error 返回错误信息
 */
typedef void(^failureBlock)(NSError * _Nullable error);



/**
 输入完成的回调

 @param inputStr 输入的信息
 */
typedef void(^inputCompleteBlock)(NSString * _Nullable inputStr);


/**
 滚动视图的回调（主要用于会员中心的轮播图滚动）

 @param currentPage 滚到当前的分页
 */
typedef void(^scrollBlock)(int currentPage);

#endif /* BlockCallBack_h */
