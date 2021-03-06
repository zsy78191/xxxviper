//
//  XXVInitModel.h
//  xxxviper
//
//  Created by 张超 on 2018/12/27.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface XXVInitModel : XXVModel
{
    
}

- (instancetype)initWithMJDictionary:(NSDictionary*)MJDictionary;

@property (nonatomic, strong) NSString* url;
@property (nonatomic, strong) NSDictionary* userInfo;
@property (nonatomic, strong) NSDictionary* queryProperties;

@end

NS_ASSUME_NONNULL_END
