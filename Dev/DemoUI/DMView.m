//
//  DMView.m
//  xxxviper
//
//  Created by 张超 on 2018/12/24.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "DMView.h"
#import "XXVTableViewOutput.h"
#import "DMApperance.h"
#import "XXVInitModel.h"
@interface DMView ()

@end

@implementation DMView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIBarButtonItem* item = [self mvp_buttonItemWithActionName:@"actionEdit"];
    [item setTitle:@"修改测试"];
    self.navigationItem.rightBarButtonItem = item;
    
    [self.interactor mvp_bindBlock:^(id view, id value) {
//        NSLog(@"%@",value);
        DMView* v = view;
        v.navigationItem.rightBarButtonItem.title = [NSString stringWithFormat:@"修改 %@",value];
    } keypath:@"testCount"];
    
    
    id x = [[self interactor] mvp_valueWithSelectorName:@"asd"];
    NSLog(@"%@",x);
}

- (Class)mvp_interactorClass
{
    return NSClassFromString(@"DMPresenter");
}

- (Class)mvp_outputerClass
{
    return NSClassFromString(@"XXVTableViewOutput");
}

- (void)mvp_configMiddleware
{
    [super mvp_configMiddleware];
    
    XXVTableViewOutput* o = (id)self.outputer;
    [o mvp_registerNib:[UINib nibWithNibName:@"AppTitleCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"AppTitleCell"];
    [o mvp_registerClass:NSClassFromString(@"XXVContentCell") forCellReuseIdentifier:@"Cell"];
    [o setDragHideKeyboard:YES];
    self.appear = [[DMApperance alloc] init];
}


- (void)mvp_initFromModel:(XXVInitModel *)model
{
    NSLog(@"%@",[model queryProperties]);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
