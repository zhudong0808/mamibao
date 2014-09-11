//
//  MmbModel.m
//  mamibao
//
//  Created by zhudong on 14-7-2.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbModel.h"

@interface MmbModel(){
}

@property (nonatomic,strong) id<MmbRequest> request;

@end


@implementation MmbModel

@synthesize itemList = _itemList;
@synthesize error = _error;


-(id)init{
    if (self = [super init]) {
        self.requestType = mmbModelRequestTypeAFNetworking;
    }
    return self;
}


#pragma mark - public method
-(void)load{
    if ([self prepareForLoad]) {
        [self.itemList reset];
        [self loadInternal];
    }
}

-(void)reload{
    
}


#pragma mark - private method
-(BOOL)prepareForLoad{
    NSString *methodName = [self methodName];
    if (!methodName || methodName.length == 0) {
        [self requestDidFailWithError:[NSError errorWithDomain:MmbMVCErrorDomain code:kMethodNameError userInfo:@{NSLocalizedDescriptionKey:@"缺少方法名"}]];
        return NO;
    } else if (self.status == mmbModelStatusLoading) {
        [self cancel];
        return YES;
    }
    return YES;
}

-(void)loadInternal{
    _error = nil;
    
    NSDictionary *dataParams = [self dataParams];
    NSDictionary *systemParams = [self systemParams];
    
    NSString *clz = @"";
    NSString *urlPath = @"";
    switch (self.requestType) {
        case mmbModelRequestTypeAFNetworking:
            clz = @"MmbAFRequest";
//            urlPath = @"api.php?";
            urlPath = @"testapi.php?";
            break;
        case mmbModelRequestTypeCustom:
            clz = [self customRequestClassName] ? : @"MmbRequest";
            break;
        default:
            clz = @"MmbAFRequest";
            urlPath = @"api.php?";
            break;
    }
    self.request = [NSClassFromString(clz) new];
    
    [self.request initRequestWithBaseURL:urlPath];
    [self.request addSystemParams:systemParams];
    [self.request addParams:dataParams];
    self.request.useAuth = self.useAuth;
    self.request.delegate = self;
    self.request.usePost = [self isPost];
    [self.request load];
}

-(MmbItemList *)itemList{
    if (!_itemList) {
        _itemList = [MmbItemList array];
    }
    return _itemList;
}



-(void)cancel{
    if (self.request) {
        self.request = nil;
    }
    _status = mmbModelStatusReady;
}


#pragma mark - MmbRequestDelegate
-(void)requestDidStartLoad:(id)request{
    _status = mmbModelStatusLoading;
    if ([self.delegate respondsToSelector:@selector(modelDidStart:)]) {
        [self.delegate modelDidStart:self];
    }
}
-(void)requestDidFinish:(id)JSON{
    _status = mmbModelStatusFinished;
    BOOL ret = [self parse:JSON];
    if (ret) {
        if ([self.delegate respondsToSelector:@selector(modeldidFinish:)]) {
            [self.delegate modeldidFinish:self];
        }
    }
}
-(void)requestDidFailWithError:(NSError *)error{
    _status = mmbModelStatusError;
    if ([self.delegate respondsToSelector:@selector(modeldidFail:withError:)]) {
        [self.delegate modeldidFail:self withError:error];
    }
}


#pragma mark - private method
-(BOOL)parse:(id)JSON{
    NSError *error = nil;
    NSArray *list = [self parseResponse:JSON error:&error];
    if (error) {
        [self requestDidFailWithError:error];
        return NO;
    } else {
        [self.itemList addObjectsFromArray:list];
        return YES;
    }
}





#pragma mark - MmbModel protocol
-(NSDictionary *)dataParams{
    return nil;
}

-(NSDictionary *)systemParams{
    return nil;
}

-(NSString *)methodName{
    return nil;
}

-(NSArray *)parseResponse:(id)JSON error:(NSError *__autoreleasing *)error{
    return nil;
}

-(BOOL)useAuth{
    return NO;
}

-(BOOL)useCache{
    return NO;
}

-(BOOL)needManualLogin{
    return YES;
}

-(BOOL)isPost{
    return NO;
}

-(NSDictionary *)bodyData{
    return nil;
}

-(NSTimeInterval)apiCacheTimeOutSeconds{
    return 0;
}

-(NSString *)customRequestClassName{
    return @"MmbRequest";
}
@end
