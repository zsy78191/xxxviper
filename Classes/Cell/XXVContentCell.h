//
//  XXVContentCell.h
//  xxxviper
//
//  Created by 张超 on 2018/12/24.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXVCellBindProtocol.h"
NS_ASSUME_NONNULL_BEGIN


@protocol XXVModelProtocol,XXVInteractorProtocol,XXVInteractorProtocol_private;
@interface XXVContentCell : UITableViewCell <XXVCellBindProtocol>

- (void)mvp_bindModel:(id<XXVModelProtocol>)model withProperties:(NSArray<NSString*>*)properties;
- (void)mvp_bindGesture:(__kindof UIGestureRecognizer*)gesture;
- (void)mvp_bindAction:(UIControlEvents)event target:(__kindof UIControl*)target actionName:(NSString*)name;
- (void)loadModel:(id<XXVModelProtocol>)model NS_REQUIRES_SUPER;
@property (nonatomic, weak) id<XXVInteractorProtocol,XXVInteractorProtocol_private> presenter;
@end

NS_ASSUME_NONNULL_END
