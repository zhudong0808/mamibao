//
//  MmbModel.h
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MmbRequest.h"
#import "MmbItemList.h"


//定义请求的状态类型：错误、就绪、进行中、完成
typedef NS_ENUM(NSInteger, mmbModelStatus) {
    mmbModelStatusError = -1,
    mmbModelStatusReady = 0,
    mmbModelStatusLoading = 1,
    mmbModelStatusFinished = 2
};

//定义model的http请求类型
typedef NS_ENUM(NSInteger, mmbModelRequestType) {
    mmbModelRequestTypeAFNetworking = 1,
    mmbModelRequestTypeCustom = 2
};

//申明model调用的回调block，当需要直接在block中处理请求结果的时候用
@class MmbModel;
typedef void(^mmbModelCallback)(MmbModel *model,NSError *error);

//分别为请求的三个状态（开始、完成、错误）定义协议方法，viewController需要实现这些协议方法，可选
@protocol MmbModelDelegate <NSObject>

@optional
-(void)modelDidStart:(MmbModel *)model;

-(void)modeldidFinish:(MmbModel *)model;

-(void)modeldidFail:(MmbModel *)model withError:(NSError *)error;

@end


//为子类定义协议方法，子类必须重载(1、获取业务参数方法 2、获取系统参数方法 3、获取接口名称方法 4、解析返回数据结果方法)
@protocol MmbModel<NSObject>

@required
/**
 *  获取业务参数
 *
 *  @return 业务参数
 */
-(NSDictionary *)dataParams;

/**
 *  获取系统参数
 *
 *  @return 系统参数
 */
-(NSDictionary *)systemParams;

/**
 *  获取接口名称
 *
 *  @return 接口名称
 */
-(NSString *)methodName;

/**
 *  解析MTop返回的JSON，并返回结果给Model来处理
 *  如果解析JSON错误，请设置error，并返回nil
 *
 *  @param JSON 请求返回的JSON结果
 *  @param error 如果解析JSON错误，请设置error
 *
 *  @return NSArray
 */
-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error;

//为子类定义协议方法，子类重载可选(1、是否使用Cache 2、是否需要登录 3、没有登录是否默认弹出登录框 4、api cache的cache时长 5、返回第三方request的类名 6、post请求body参数  7、是否为post请求)
@optional

/**
 *  是否使用Cache，默认NO
 *
 *  @return BOOL
 */
- (BOOL)useCache;

/**
 *  是否使用账号验证逻辑，例如一些需要登录的接口，需要设置。默认NO
 *
 *  @return BOOL
 */
- (BOOL)useAuth;


/**
 *  如果没有登录，是否需要弹出登陆框进行登录；默认为YES
 *
 *  @return BOOL
 */
- (BOOL)needManualLogin;

/**
 *  api cache的cache时长
 *  @return NSTimeInterval
 */
- (NSTimeInterval)apiCacheTimeOutSeconds;

/**
 *  如果requestType指定为custom，则这个方法要返回第三方request的类名
 *
 *
 *  @return 第三方request的类名
 */
- (NSString* )customRequestClassName;

/**
 *  POST 请求的body参数
 *
 *  @return {key => NSString,文件名，需要后缀 : data => NSData，上传的文件}
 */
- (NSDictionary* )bodyData;

/**
 *  是否是POST请求
 *
 */
- (BOOL)isPost;

@end


@interface MmbModel : NSObject<MmbModel,MmbRequestDelegate>

//属性定义
//model的请求类型：mtop / af networking
@property (nonatomic,assign) mmbModelRequestType requestType;

//Model的状态
@property (nonatomic,assign) mmbModelStatus status;

//Model的delegate
@property (nonatomic,weak) id<MmbModelDelegate> delegate;

//数据列表
@property (nonatomic,strong,readonly) MmbItemList *itemList;

//错误对象，默认为nil
@property(nonatomic, strong,readonly) NSError *error;

//Model的key，用于标识Model
@property(nonatomic,strong) NSString* key;

//返回的response 对象
@property(nonatomic,strong,readonly) id responseObject;

//返回的response string
@property(nonatomic,strong,readonly) NSString* responseString;

//model的请求操作，回调使用delegate
- (void)load;

//model的请求操作，回调使用block
- (void)loadWithCompletion:(mmbModelCallback)aCallback;

//model重新请求，回调使用delegate
- (void)reload;

//model的重新请求操作，回调使用block
- (void)reloadWithCompletion:(mmbModelCallback)aCallback;

//model加载更多的请求
- (void)loadMore;

//取消model请求
- (void)cancel;

//清空model数据，重置model的状态
- (void)reset;

//实现requestDelegate三个状态协议方法（开始、完成、错误）
- (void)requestDidStartLoad:(MmbRequest *)request;
- (void)requestDidFinish:(id)JSON;
- (void)requestDidFailWithError:(NSError *)error;

//是否正在请求
- (BOOL)isLoading;

@end
