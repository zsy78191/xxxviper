//
//  MVCListView.h
//  xxxviper
//
//  Created by 张超 on 2018/12/17.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVPresenter.h"
#import "XXVEmptyMiddleware.h"
NS_ASSUME_NONNULL_BEGIN

/**
 XXVListView 支持两种Outputer，TableView和CollectionView
 */
@interface XXVListPresenter : XXVPresenter

@property (nonatomic, strong) XXVEmptyMiddleware* empty;


@end

NS_ASSUME_NONNULL_END
