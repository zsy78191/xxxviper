//
//  UIViewController+mvc_base.h
//  xxxviper
//
//  Created by 张超 on 2018/12/14.
//  Copyright © 2018 orzer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XXVProtocol.h"

NS_ASSUME_NONNULL_BEGIN
@class XXVInitModel;
@class XXVViewApperance;
@protocol XXVOutputProtocol,XXVInputProtocol,XXVInteractorProtocol_private;
@interface XXVPresenter : UIViewController <XXVPresenterProtocol>
{
    
}

- (void)mvp_configMiddleware NS_REQUIRES_SUPER;
- (UIBarButtonItem*)mvp_buttonItemWithActionName:(NSString *)name;
- (UIBarButtonItem*)mvp_buttonItemWithActionName:(NSString*)name title:(NSString*)title;
- (UIBarButtonItem*)mvp_buttonItemWithSystem:(UIBarButtonSystemItem)systemItem actionName:(NSString*)name title:(NSString*)title;

#pragma mark - config

- (void)mvp_bindData;
- (void)mvp_bindAction;
- (void)mvp_configTable;
- (void)mvp_configOther;

- (void)mvp_bindAction:(UIControlEvents)event target:(__kindof UIControl*)target actionName:(NSString*)name;
- (void)mvp_unbindAction:(UIControlEvents)event target:(__kindof UIControl*)target actionName:(NSString*)name;
- (void)mvp_bindSelector:(SEL)selector;
- (void)mvp_bindGesture:(__kindof UIGestureRecognizer*)gesture;

@property (nonatomic, strong, readonly) id<XXVOutputProtocol> outputer;
@property (nonatomic, strong) id<XXVInputProtocol> inputer;
@property (nonatomic, strong) __kindof XXVViewApperance* appear;

- (void)mvp_initFromModel:(XXVInitModel*)model;
- (instancetype)initWithUserInfo:(NSDictionary*)userinfo;
- (void)mvp_reloadData;
- (void)mvp_runAction:(SEL)selector;

@end

NS_ASSUME_NONNULL_END
