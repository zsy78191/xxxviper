//
//  UIViewController+mvc_base.m
//  xxxviper
//
//  Created by 张超 on 2018/12/14.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVPresenter.h"
@import ReactiveObjC;
#import "XXVBaseMiddleware.h"
#import "XXVProtocol_private.h"
#import "XXVViewApperanceProtocol.h"
#import "XXVViewApperance.h"
#import "XXVSubView.h"
#import "XXVOutputProtocol.h"
#import "XXVInitModel.h"
@import ui_base;

//#import "MyItem.h"
@interface XXVPresenter ()
@property (nonatomic, strong, readwrite) id<XXVInteractorProtocol,XXVInteractorProtocol_private> interactor;
@property (nonatomic, strong, readwrite) id<XXVOutputProtocol> outputer;
@end

@implementation XXVPresenter

- (Class)mvp_outputerClass
{
    return NSClassFromString(@"XXVTableViewOutput");
}

@synthesize outputer = _outputer;

- (__kindof id<XXVOutputProtocol>)outputer
{
    if (!_outputer) {
        _outputer = [[[self mvp_outputerClass] alloc] init];
        [(XXVBaseMiddleware*)_outputer setInteractor:self.interactor];
    }
    return _outputer;
}

- (void)mvp_initFromModel:(XXVInitModel *)model
{
    
}

- (instancetype)initWithUserInfo:(NSDictionary *)userinfo
{
    self = [super init];
    if (self) {
        XXVInitModel* m = [[XXVInitModel alloc] initWithMJDictionary:userinfo];
        if ([self respondsToSelector:@selector(mvp_initFromModel:)]) {
            [self mvp_initFromModel:m];
        }
        if ([self.interactor respondsToSelector:@selector(mvp_initFromModel:)]) {
            [self.interactor mvp_initFromModel:m];
        }
    }
    return self;
}

void uibase_swizzleMethod(Class class, SEL originalSelector, SEL swizzledSelector);
 
+ (void)load
{
    uibase_swizzleMethod([XXVPresenter class], @selector(viewDidLoad), @selector(viewDidLoad_mvcbase));
}

- (void)setInputer:(__kindof id<XXVInputProtocol>)inputMiddleware
{
    _inputer = inputMiddleware;
    [(XXVBaseMiddleware*)_inputer setInteractor:self.interactor];
}

- (void)setOutputer:(__kindof id<XXVOutputProtocol>)outputMiddleware
{
    _outputer = outputMiddleware;
    [(XXVBaseMiddleware*)_outputer setInteractor:self.interactor];
}


- (id<XXVInteractorProtocol,XXVInteractorProtocol_private>)interactor
{
    if (!_interactor) {
        _interactor = [[[self mvp_presenterClass] alloc] init];
        _interactor.presenter = self;
    }
    return _interactor;
}

- (void)viewDidLoad_mvcbase;
{
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    if ([self respondsToSelector:@selector(mvp_configMiddleware)]) {
        [self mvp_configMiddleware];
    }
    
    [self viewDidLoad_mvcbase];
    
 
    if ([self respondsToSelector:@selector(mvp_configTable)]) {
        [self mvp_configTable];
    }
    
    if ([self respondsToSelector:@selector(mvp_configOther)]) {
        [self mvp_configOther];
    }
    
    if ([self respondsToSelector:@selector(mvp_bindData)]) {
        [self mvp_bindData];
    }
    
    if ([self respondsToSelector:@selector(mvp_bindAction)]) {
        [self mvp_bindAction];
    }
    
    self.view.tag = XXVViewTagContentView;
    
    if (self.appear) {
        [self.appear mvp_setupView:self.view];
    }
}

- (void)loadView
{
    self.view = ({
        XXVSubView* v = [[XXVSubView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        [v setView:self];
        v;
    });
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated
{
    [super setEditing:editing animated:animated];
    if ([self.outputer respondsToSelector:@selector(setEditing:animated:)]) {
        [self.outputer setEditing:editing animated:animated];
    }
    
}

- (Class)mvp_presenterClass
{
    return NSClassFromString(@"XXVPresenter");
}

-(void)mvp_bindData
{
   
}

- (void)mvp_bindAction
{
    
}

- (void)mvp_configOther
{
    
}


- (void)mvp_configTable
{
    
}

- (void)mvp_configMiddleware
{
    
}

- (void)mvp_reloadData
{
    [self.outputer reloadData];
}

- (void)mvp_runAction:(SEL)selector
{
    if ([self respondsToSelector:selector]) {
        IMP imp = [self methodForSelector:selector];
        void (*func)(id, SEL) = (void *)imp;
        func(self, selector);
    }
    else {
        NSLog(@"%@ can't responds To Selector %@",self,NSStringFromSelector(selector));
    }
}

- (void)mvp_pushViewController:(__kindof UIViewController *)vc
{
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)mvp_popViewController:(__kindof UIViewController *)vc
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)mvp_showViewController:(__kindof UIViewController *)vc
{
    [self.navigationController showViewController:vc sender:nil];
}

- (void)mvp_presentViewController:(__kindof UIViewController *)vc animated:(BOOL)flag completion:(void (^)(void))completion
{
    [self presentViewController:vc animated:flag completion:completion];
}

- (void)mvp_dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion
{
    [self dismissViewControllerAnimated:flag completion:completion];
}

#pragma mark - action

- (void)mvc_action:(id)sender
{
    
}

- (UIBarButtonItem *)mvp_buttonItemWithActionName:(NSString *)name
{
    UIBarButtonItem* b = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self.interactor action:@selector(mvc_action:)];
    [self.interactor mvp_registActionName:name item:b];
    return b;
}

- (UIBarButtonItem *)mvp_buttonItemWithActionName:(NSString *)name title:(nonnull NSString *)title
{
    UIBarButtonItem* b = [[UIBarButtonItem alloc] initWithTitle:title style:UIBarButtonItemStylePlain target:self.interactor action:@selector(mvc_action:)];
    b.accessibilityLabel = title;
    [self.interactor mvp_registActionName:name item:b];
    return b;
}

- (UIBarButtonItem*)mvp_buttonItemWithSystem:(UIBarButtonSystemItem)systemItem actionName:(NSString *)name title:(NSString *)title
{
    UIBarButtonItem* b = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:systemItem target:self.interactor action:@selector(mvc_action:)];
    b.title = title;
    b.accessibilityLabel = title;
    [self.interactor mvp_registActionName:name item:b];
    return b;
}

- (void)mvp_bindAction:(UIControlEvents)event target:(__kindof UIControl*)target actionName:(nonnull NSString *)name
{
    [target addTarget:self.interactor action:@selector(mvc_action:) forControlEvents:event];
    [self.interactor mvp_registActionName:name item:target];
}

- (void)mvp_unbindAction:(UIControlEvents)event target:(__kindof UIControl *)target actionName:(NSString *)name
{
    [target removeTarget:self.interactor action:@selector(mvc_action:) forControlEvents:event];
    [self.interactor mvp_removeActionForItem:target];
}

- (void)mvp_bindGesture:(__kindof UIGestureRecognizer *)gesture
{
    id<XXVInteractorProtocol> presenter = self.interactor;
    [[[gesture rac_gestureSignal] takeUntil:self.rac_willDeallocSignal] subscribeNext:^(__kindof UIGestureRecognizer * _Nullable x) {
        if ([presenter respondsToSelector:@selector(mvp_gestrue:)]) {
            [presenter mvp_gestrue:x];
        }
    }];
}

- (void)mvp_bindSelector:(SEL)selector
{
    [[self rac_signalForSelector:selector] subscribeNext:^(RACTuple * _Nullable x) {
        if ([self.interactor respondsToSelector:selector]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            [self.interactor performSelector:selector withObject:x];
#pragma clang diagnostic pop
        }
        else
        {
            NSLog(@"warning presenter %@ didn't have selector named %@",self.interactor,NSStringFromSelector(selector));
        }
    }];
}


@end
