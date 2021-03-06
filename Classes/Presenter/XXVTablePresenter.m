//
//  XXVScrollView.m
//  xxxviper
//
//  Created by 张超 on 2018/12/24.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVTablePresenter.h"
#import "XXVOutputProtocol.h"

@interface XXVTablePresenter ()
{
    
}

@property (nonatomic, strong) __kindof UIView* manageView;

@end

@implementation XXVTablePresenter

- (void)mvp_configMiddleware
{
    [super mvp_configMiddleware];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([self.manageView isKindOfClass:[UITableView class]]) {
//        UITableView* table = (UITableView*)self.manageView;
//        [table setAllowsSelection:NO];
    }
    else {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
        label.text = @"XXVScrollView只支持TableViewOutputer";
        [label setTextAlignment:NSTextAlignmentCenter];
        [self.view addSubview:label];
        label.center = self.view.center;
    }
}

- (void)setAllowsSelection:(BOOL)allowsSelection
{
    _allowsSelection = allowsSelection;
    if ([self.manageView isKindOfClass:[UITableView class]]) {
        UITableView* table = (UITableView*)self.manageView;
        [table setAllowsSelection:allowsSelection];
    }
}

@end
