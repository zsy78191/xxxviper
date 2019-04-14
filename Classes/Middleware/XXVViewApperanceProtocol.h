//
//  XXVViewApperanceProtocol.h
//  xxxviper
//
//  Created by 张超 on 2018/12/25.
//  Copyright © 2018 orzer. All rights reserved.
//

#ifndef XXVViewApperanceProtocol_h
#define XXVViewApperanceProtocol_h
@class UIView;
@protocol XXVViewApperanceProtocol <NSObject>

@required
- (void)mvp_setupView:(__kindof UIView*)view;

@end

#endif /* XXVViewApperanceProtocol_h */
