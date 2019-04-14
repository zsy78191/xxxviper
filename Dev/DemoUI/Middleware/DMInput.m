//
//  DMInput.m
//  xxxviper
//
//  Created by 张超 on 2018/12/24.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "DMInput.h"
#import "AppInfoModel.h"

@interface DMInput ()
{
    
}
@property (nonatomic, strong) NSDictionary* modelIdentifierTable;

@end


@implementation DMInput

- (NSDictionary *)modelIdentifierTable
{
    if (!_modelIdentifierTable) {
        _modelIdentifierTable =
            @{
              @"AppInfoModel":@"AppTitleCell",
              @"XXVViewModel":@"Cell"
              };
    }
    return _modelIdentifierTable;
}

- (NSString *)mvp_identifierForModel:(id<XXVModelProtocol>)model
{
    return self.modelIdentifierTable[NSStringFromClass([model class])];
}

@end
