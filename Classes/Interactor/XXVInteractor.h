//
//  MVCPresenter.h
//  xxxviper
//
//  Created by 张超 on 2018/12/14.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XXVProtocol.h"
#import "XXVRouter.h"
NS_ASSUME_NONNULL_BEGIN
@class XXVInitModel;
@interface XXVInteractor : NSObject <XXVInteractorProtocol>

- (Class)routerClass;
@property (nonatomic, strong) __kindof XXVRouter* router;


@end

NS_ASSUME_NONNULL_END
