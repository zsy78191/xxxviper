//
//  XXVScrollView.h
//  xxxviper
//
//  Created by 张超 on 2018/12/24.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVListPresenter.h"

NS_ASSUME_NONNULL_BEGIN

/**
 XXVTableView 仅支持一种Output，TableView
 */
@interface XXVTablePresenter : XXVListPresenter

@property (nonatomic) BOOL allowsSelection;

@end

NS_ASSUME_NONNULL_END
