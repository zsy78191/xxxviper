//
//  XXVComplexInput.h
//  xxxviper
//
//  Created by 张超 on 2019/1/8.
//  Copyright © 2019 orzer. All rights reserved.
//

#import "XXVBaseMiddleware.h"
#import "XXVOutputProtocol.h"
NS_ASSUME_NONNULL_BEGIN


/**
 组合其他Input使用的Input，当组合CoredataInput时，CoredataInput必须提供单section数据
 */
@interface XXVComplexInput : XXVBaseMiddleware <XXVInputProtocol>
{
    
}
- (void)addInput:(id<XXVInputProtocol>)input;
- (void)deleteInput:(id<XXVInputProtocol>)input;
- (id<XXVInputProtocol>)inputerAtIndexPath:(NSIndexPath*)path;

@end

NS_ASSUME_NONNULL_END
