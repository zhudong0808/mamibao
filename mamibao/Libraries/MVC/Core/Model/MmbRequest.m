//
//  MmbRequest.m
//  mamibao
//
//  Created by zhudong on 14-7-3.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbRequest.h"

@implementation MmbRequest

@synthesize useAuth = _useAuth;
@synthesize useCache = _useCache;
@synthesize apiCacheTimeOutSeconds = _apiCacheTimeOutSeconds;
@synthesize showLogin = _showLogin;
@synthesize usePost = _usePost;
@synthesize delegate = _delegate;


-(void)load{
    
}

-(void)initRequestWithBaseURL:(NSString *)url{
}

-(void)addParams:(NSDictionary *)params{
}

-(void)addSystemParams:(NSDictionary *)params{
    
}

@end
