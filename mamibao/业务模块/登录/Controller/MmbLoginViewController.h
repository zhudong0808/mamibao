//
//  MmbLoginViewController.h
//  mamibao
//
//  Created by zhudong on 14-9-30.
//  Copyright (c) 2014年 mamibao. All rights reserved.
//

#import "MmbViewController.h"
#import "MmbLoginView.h"

typedef void (^MmbLoginCompletion)(BOOL success);

@interface MmbLoginViewController : MmbViewController<MmbLoginViewDelegate>

@property (nonatomic,strong) MmbLoginCompletion loginCompletion;

@end
