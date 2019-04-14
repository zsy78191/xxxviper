//
//  MVCBaseMiddleware.h
//  xxxviper
//
//  Created by 张超 on 2018/12/17.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol XXVInteractorProtocol,XXVInteractorProtocol_private;
@interface XXVBaseMiddleware : NSObject

@property (nonatomic, weak) id<XXVInteractorProtocol,XXVInteractorProtocol_private> interactor;

@end

NS_ASSUME_NONNULL_END
