//
//  MVCModel.h
//  xxxviper
//
//  Created by 张超 on 2018/12/14.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXVProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@class XXVModel;
typedef void (^XXVModelInitailBlock)(__kindof XXVModel*);
typedef __kindof XXVModel* _Nullable (^XXVModelNewInstanceBlock)(XXVModelInitailBlock);
@interface XXVModel : NSObject <XXVModelProtocol>
- (BOOL)same:(id)v1 with:(id)v2;
@property (nonatomic, readonly, class) XXVModelNewInstanceBlock m;

@end

NS_ASSUME_NONNULL_END
