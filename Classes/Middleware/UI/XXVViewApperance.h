//
//  XXVViewApperance.h
//  xxxviper
//
//  Created by 张超 on 2018/12/25.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVBaseMiddleware.h"
#import "XXVViewApperanceProtocol.h"
@import UIKit;

typedef enum : NSUInteger {
    XXVViewTagManageView = 0x89ab1,
    XXVViewTagContentView = 0x89ab2,
} XXVViewTag;

NS_ASSUME_NONNULL_BEGIN

@interface XXVViewApperance : XXVBaseMiddleware <XXVViewApperanceProtocol>

@end

NS_ASSUME_NONNULL_END
