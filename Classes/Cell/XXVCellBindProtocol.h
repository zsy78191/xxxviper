//
//  XXVCellBindProtocol.h
//  xxxviper
//
//  Created by 张超 on 2018/12/25.
//  Copyright © 2018 orzer. All rights reserved.
//

#ifndef XXVCellBindProtocol_h
#define XXVCellBindProtocol_h

@protocol XXVModelProtocol;
@protocol XXVCellBindProtocol <NSObject>

@required
- (void)mvp_value:(id)value updateForKeypath:(NSString*)keypath;
- (void)loadModel:(id<XXVModelProtocol>)model;

@end

#endif /* XXVCellBindProtocol_h */
