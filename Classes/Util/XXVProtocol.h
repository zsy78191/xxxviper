//
//  MVCProtocol.h
//  xxxviper
//
//  Created by 张超 on 2018/12/14.
//  Copyright © 2018 orzer. All rights reserved.
//

#ifndef MVCProtocol_h
#define MVCProtocol_h

NS_ASSUME_NONNULL_BEGIN

@import UIKit;
@import CoreData;

@protocol XXVPresenterProtocol,XXVOutputProtocol,XXVInputProtocol,XXVInteractorProtocol_private,NSFetchRequestResult;
@class UIViewController,XXVInitModel,NSManagedObject,UIGestureRecognizer,UIAlertController,UIView;

@protocol XXVModelProtocol <NSObject,NSFetchRequestResult>

@property (nonatomic, strong) NSString* cell_identifier;
- (NSArray *)propertys;
@property (nonatomic, weak) id<XXVInputProtocol> inputer;
- (BOOL)mvp_sameWithModel:(id<XXVModelProtocol>)model;
- (BOOL)mvp_sameWithCoreDataModel:(__kindof NSManagedObject*)model;

- (void)removeFromInputer;
@end

@protocol XXVInteractorProtocol <NSObject>

@property (nonatomic, weak) id<XXVPresenterProtocol> presenter;

- (void)mvp_initFromModel:(XXVInitModel*)model;

- (void)mvp_bindItem:(id)item propertyName:(NSString *)name keypath:(NSString*)keypath;
- (void)mvp_bindBlock:(void (^)(id view,id value))block keypath:(NSString*)keypath;
- (void)mvp_bindChangeBlock:(void (^)(id view,id value,id add,id remove,id modify))block keypath:(NSString*)keypath;
- (nullable id)mvp_valueWithSelectorName:(NSString*)name;
- (nullable id)mvp_valueWithSelectorName:(NSString*)name sender:(id)sender;


#pragma mark - action for mvpview
- (void)mvp_gestrue:(__kindof UIGestureRecognizer*)gesture;

#pragma mark - action
- (void)mvp_action_selectItemAtIndexPath:(NSIndexPath*)path;

#pragma mark - action for contentCell
- (void)mvp_action_withModel:(id<XXVModelProtocol>)model value:(id)value;
- (void)mvp_gestrue:(__kindof UIGestureRecognizer*)gesture model:(id<XXVModelProtocol>)model;

@required
- (id)mvp_inputerWithOutput:(id<XXVOutputProtocol>)output;
@end

@protocol XXVPresenterProtocol <NSObject>

@optional

- (void)mvp_pushViewController:(__kindof UIViewController*)vc;
- (void)mvp_popViewController:(__kindof UIViewController*)vc;
- (void)mvp_showViewController:(__kindof UIViewController*)vc;
- (void)mvp_presentViewController:(__kindof UIViewController*)vc animated: (BOOL)flag completion:(void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);
- (void)mvp_dismissViewControllerAnimated: (BOOL)flag completion: (void (^ __nullable)(void))completion NS_AVAILABLE_IOS(5_0);;

- (UIAlertController*)alert:(NSString*)title
                  recommend:(NSString*)recommend
                     action:(NSString*)action
                     cancel:(NSString*)cancel
                      block:(void(^)(NSInteger idx, __kindof UIViewController* vc))block;

- (UIAlertController*)actionsheet:(NSString*)title
                        recommend:(NSString*)recommend
                           action:(NSString*)action
                           cancel:(NSString*)cancel
                            block:(void(^)(NSInteger idx, __kindof UIViewController* vc))block;

- (void)showAsProver:(UIAlertController*)controller
                view:(__kindof UIView* )sourceView
                rect:(CGRect) sourceRect
               arrow:(UIPopoverArrowDirection) arrow;

- (void)showAsProver:(UIAlertController*)controller
                view:(__kindof UIView* )sourceView
                item:(UIBarButtonItem*) item
               arrow:(UIPopoverArrowDirection) arrow;


- (void)hudInfo:(NSString*)message;
- (void)hudSuccess:(NSString*)message;
- (void)hudFail:(NSString*)message;
- (void)hudProgress:(float)progress;
- (void)hudWait:(NSString*)message;
- (void)hudDismiss;

- (void)mvp_reloadData;
- (void)mvp_runAction:(SEL)selector;

@required
- (Class)mvp_presenterClass;
- (Class)mvp_outputerClass;

@property (nonatomic, strong, readonly) id<XXVInteractorProtocol,XXVInteractorProtocol_private> interactor;


@end

NS_ASSUME_NONNULL_END
 

#endif /* MVCProtocol_h */
