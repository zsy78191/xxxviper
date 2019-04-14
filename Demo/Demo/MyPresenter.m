//
//  MyPresenter.m
//  xxxviper
//
//  Created by 张超 on 2018/12/14.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "MyPresenter.h"
#import "Maininput.h"
#import "XXVComplexInput.h"
#import "CoreInput.h"
#import "MyView.h"
#import "MyModel.h"
@import MagicalRecord;


@interface MyPresenter()
{
    
}
@property (nonatomic, strong) MainInput* mainInput;
@property (nonatomic, strong) CoreInput* coreInput;
@property (nonatomic, strong) XXVComplexInput* ci;
@property (nonatomic, strong) NSString* testString;
@end

@implementation MyPresenter

- (MainInput *)mainInput
{
    if (!_mainInput) {
        _mainInput = [[MainInput alloc] init];
    }
    return _mainInput;
}


- (CoreInput *)coreInput
{
    if (!_coreInput) {
        _coreInput = [[CoreInput alloc] init];
    }
    return _coreInput;
}

- (XXVComplexInput *)ci
{
    if (!_ci) {
        _ci = [[XXVComplexInput alloc] init];
    }
    return _ci;
}


- (id)mvp_inputerWithOutput:(id<XXVOutputProtocol>)output
{
    [self.ci addInput:self.coreInput];
    [self.ci addInput:self.mainInput];
    return self.ci;
}

- (void)addModel
{
    MyModel* m = [[MyModel alloc] init];
//    m.identifier = @"MyCell";
    m.name = [[NSDate date] description];
    [self.mainInput mvp_insertModel:m atIndex:0];
}

- (void)actionDel:(NSIndexPath*)path
{
    [self.ci mvp_deleteModelAtIndexPath:path];
}

- (void)cleanAll
{
    [self.ci mvp_cleanAll];
}

- (void)mvp_action_selectItemAtIndexPath:(NSIndexPath *)path
{
//    [self.ci mvp_deleteModelAtIndexPath:path];
    id model = [self.ci mvp_modelAtIndexPath:path];
    if([model isKindOfClass:[NSManagedObject class]])
    {
        [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
            MyModel* m = [model MR_inContext:localContext];
            m.name = [NSString stringWithFormat:@"%@",@(arc4random()%20)];
        } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
                    MyModel* m = [model MR_inContext:localContext];
                    m.title = [NSString stringWithFormat:@"%@",@(arc4random()%20)];
                } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
                    
                }];
            });
        }];
    }
}

- (void)openCore
{
//    CoreListView* view = [[CoreListView alloc] init];
    id view = [XXVRouter viewForURL:@"demo://corelistview" withUserInfo:@{@"a":@(1)}];
    [self.presenter mvp_pushViewController:view];
}

- (void)openCore2
{
    //    CoreListView* view = [[CoreListView alloc] init];
    id view = [XXVRouter viewForURL:@"demo://democollectionview" withUserInfo:@{@"type":@"collection"}];
    [self.presenter mvp_pushViewController:view];
}


- (void)openUI
{
    id view = [XXVRouter viewForURL:@"demo://demoui?asd=123" withUserInfo:@{@"a":@(1)}];
    [self.presenter mvp_pushViewController:view];
}

- (void)openCollectionView:(id)a
{
    id view = [XXVRouter viewForURL:@"demo://democollectionview" withUserInfo:nil];
    [self.presenter mvp_pushViewController:view];
}

- (void)refreshData:(UIRefreshControl*)control
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [control endRefreshing];
    });
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"%@",@(animated));
}

- (void)mvp_gestrue:(__kindof UIGestureRecognizer *)gesture
{
    NSLog(@"%@",gesture);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        [self.router regiestTarget:self selector:@selector(testString) asRouter:@"demo://getTestString"];
        self.testString = @"123";
        
        [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelOff];
        
    }
    return self;
}

- (void)testRouterURL
{
    NSLog(@"%@",[self.router valueForRouterURL:@"demo://getTestString2"]);
}

@end


@implementation model



@end
