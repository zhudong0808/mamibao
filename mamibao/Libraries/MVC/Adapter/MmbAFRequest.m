//
//  MmbAFRequest.m
//  mamibao
//
//  Created by zhudong on 14-7-4.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbAFRequest.h"
#import "AFNetworking.h"

@interface MmbAFRequest(){
}

@property (nonatomic,strong) AFHTTPRequestOperationManager *afClient;
@property (nonatomic,strong) NSMutableDictionary *params;
@property (nonatomic,strong) NSMutableDictionary *systemParams;
@property (nonatomic,strong) NSString *url;

@end

@implementation MmbAFRequest

-(void)load{
//    [self.params addEntriesFromDictionary:self.systemParams];
    [self.delegate requestDidStartLoad:self];
    if (self.usePost) {
        [self.afClient POST:_url parameters:self.params constructingBodyWithBlock:^(id<AFMultipartFormData> fromData){
        } success:^(AFHTTPRequestOperation *operation,id responseObject){
            [self.delegate requestDidFinish:responseObject];
        } failure:^(AFHTTPRequestOperation *operation,NSError *error){
            [self.delegate requestDidFailWithError:error];
        }];
    } else {
        [self.afClient GET:_url parameters:self.params success:^(AFHTTPRequestOperation *operation,id responseObject){
            [self.delegate requestDidFinish:responseObject];
        } failure:^(AFHTTPRequestOperation *operation,NSError *error){
            [self.delegate requestDidFailWithError:error];
        }];
    }
}

-(void)initRequestWithBaseURL:(NSString *)url{
    _url = url;
    self.afClient = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:API_URL]];
}

-(void)addParams:(NSMutableDictionary *)params{
    self.params = params;
}

-(void)addSystemParams:(NSMutableDictionary *)params{
    self.systemParams = params;
}



@end
