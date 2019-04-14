//
//  XXVCoredataInput.h
//  xxxviper
//
//  Created by 张超 on 2018/12/22.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXVBaseMiddleware.h"
#import "XXVOutputProtocol.h"
NS_ASSUME_NONNULL_BEGIN
@class NSManagedObject;
@protocol XXVModelProtocol,NSFetchRequestResult;
@interface XXVCoredataInput : XXVBaseMiddleware <XXVCoreDataInputProtocol>

- (Class)mvp_modelClass;
- (void)loadCoreData:(__kindof NSManagedObject*)obj fromModel:(id<XXVModelProtocol>)model;

@end

NS_ASSUME_NONNULL_END
