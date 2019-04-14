//
//  MVCListView.m
//  xxxviper
//
//  Created by 张超 on 2018/12/17.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVListPresenter.h"
#import "XXVOutputProtocol.h"
#import "XXVViewApperanceProtocol.h"
#import "XXVViewApperance.h"
@interface XXVListPresenter ()
{
    
}

@property (nonatomic, strong) __kindof UIView* manageView;


@end

@implementation XXVListPresenter

- (void)mvp_configMiddleware
{
    [super mvp_configMiddleware];
 
    if (self.outputer) {
        //FIX manageView前移
        __kindof UIView* v = [self.outputer outputView];
        if ([v isKindOfClass:[UITableView class]] || [v isKindOfClass:[UICollectionView class]]) {
            self.manageView = v;
        }
    }
    else {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        label.text = @"没有设置Outputer";
        [label setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:label];
        label.center = self.view.center;
    }
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self.interactor respondsToSelector:@selector(mvp_inputerWithOutput:)]) {
         self.inputer = [self.interactor mvp_inputerWithOutput:self.outputer];
    }
    else {
        NSLog(@"warning %@ did not has selector [mvp_inputerWithOutput:]",self.interactor);
    }
    
    
    
    if (self.inputer) {
        self.outputer.inputer = self.inputer;
        self.inputer.outputer = self.outputer;
    }
    
    if (self.empty) {
        [self.outputer setEmpty:self.empty];
    }
    
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",self.inputMiddleware);
    self.manageView.tag = XXVViewTagManageView;
    [self.view addSubview:self.manageView];
    
//    if (self.apperMiddleware) {
//        [self.apperMiddleware mvp_setupView:self.manageView];
//    }
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    [self.manageView setFrame:self.view.bounds];
}





@end
