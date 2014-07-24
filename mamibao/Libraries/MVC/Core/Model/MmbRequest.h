//
//  MmbRequest.h
//  mamibao
//
//  Created by zhudong on 14-7-3.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MmbRequest;

@protocol MmbRequestDelegate <NSObject>

@required

- (void)requestDidStartLoad:(id<MmbRequest> )request;
- (void)requestDidFinish:(id)JSON;
- (void)requestDidFailWithError:(NSError *)error;

@end


@protocol MmbRequest <NSObject>

@property (nonatomic,assign) BOOL useCache;

@property (nonatomic,assign) BOOL useAuth;

@property (nonatomic,assign) BOOL showLogin;

@property (nonatomic,assign) NSTimeInterval apiCacheTimeOutSeconds;

@property (nonatomic,assign) BOOL usePost;

@property (nonatomic,weak) id<MmbRequestDelegate> delegate;

/**
 *  发起请求
 */
-(void)load;

/**
 *  创建请求对象
 *
 *  @param url 请求接口名称
 */
-(void)initRequestWithBaseURL:(NSString *)url;


/**
 *  添加业务参数
 *
 *  @param params 业务参数
 */
-(void)addParams:(NSDictionary *)params;

/**
 *  添加系统参数
 *
 *  @param params 系统参数
 */
-(void)addSystemParams:(NSDictionary *)params;




@end

@interface MmbRequest : NSObject<MmbRequest>

@end
