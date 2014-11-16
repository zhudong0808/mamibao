//
//  MmbAFRequest.m
//  mamibao
//
//  Created by zhudong on 14-7-4.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbAFRequest.h"
#import "AFNetworking.h"
#import "MmbSignature.h"

@interface MmbAFRequest(){
}

@property (nonatomic,strong) AFHTTPRequestOperationManager *afClient;
@property (nonatomic,strong) NSMutableDictionary *params;
@property (nonatomic,strong) NSMutableDictionary *systemParams;
@property (nonatomic,strong) NSString *url;

@end

@implementation MmbAFRequest

-(void)load{
    [self.delegate requestDidStartLoad:self];
    if (self.usePost) {
        [self.afClient POST:_url parameters:[self getAllParams] constructingBodyWithBlock:^(id<AFMultipartFormData> fromData){
        } success:^(AFHTTPRequestOperation *operation,id responseObject){
            [self.delegate requestDidFinish:responseObject];
            #ifdef ifDebug
            NSLog([NSString stringWithFormat:@"url=%@,\nresponseObject=%@",operation.request.URL,responseObject],nil);
            #endif
        } failure:^(AFHTTPRequestOperation *operation,NSError *error){
            [self.delegate requestDidFailWithError:error];
        }];
    } else {
        [self.afClient GET:_url parameters:[self getAllParams] success:^(AFHTTPRequestOperation *operation,id responseObject){
            [self.delegate requestDidFinish:responseObject];
            #ifdef ifDebug
            NSLog([NSString stringWithFormat:@"requestUrl=%@,\nresponseObject=%@",operation.request.URL,responseObject],nil);
            #endif
        } failure:^(AFHTTPRequestOperation *operation,NSError *error){
            NSLog([NSString stringWithFormat:@"requestUrl=%@,\nresponseObject=%@",operation.request.URL,error],nil);
            [self.delegate requestDidFailWithError:error];
        }];
    }
}

-(void)initRequestWithBaseURL:(NSString *)url{
    
    _url = url;
    self.afClient = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:API_URL]];
    
    //登录操作
    if (self.useAuth && self.showLogin) {
        [[MmbAuthenticateCenter shareInstance] authenticateWithCompletion:^(BOOL success){
            if (success == YES) {
                [self load];
            }
        }];
    } else {
        [self load];
    }
}

-(void)addParams:(NSMutableDictionary *)params{
    self.params = params;
}

-(void)addSystemParams:(NSMutableDictionary *)params{
    self.systemParams = params;
}

//获取所有的参数字典
-(NSMutableDictionary *)getAllParams{
    NSMutableDictionary *allParams = [NSMutableDictionary dictionary];
    [allParams setValuesForKeysWithDictionary:self.params];
    [allParams setValuesForKeysWithDictionary:self.systemParams];
    if (self.useAuth) {
        [allParams setObject:[MmbAuthenticateCenter getEncryptString] forKey:@"encryptString"];
    }
    MmbSignature *signatureHelper = [MmbSignature new];
    signatureHelper.params = allParams;
    NSString *sign = [signatureHelper getSignString];
    [allParams setObject:sign forKey:@"sign"];
    return allParams;
}

- (void)dealloc {
   
}

@end
