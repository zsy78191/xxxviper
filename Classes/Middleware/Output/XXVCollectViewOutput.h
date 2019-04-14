//
//  XXVCollectViewOutput.h
//  xxxviper
//
//  Created by 张超 on 2018/12/25.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVBaseMiddleware.h"
#import "XXVOutputProtocol.h"

//#import "XXVCollectionViewDelegate.h"

NS_ASSUME_NONNULL_BEGIN
@class UICollectionViewLayout,UINib;
@interface XXVCollectViewOutput : XXVBaseMiddleware <XXVCollectionViewOutputProtocol>

- (__kindof UICollectionViewLayout*)collectionViewLayout;

//@property (nonatomic, strong) XXVCollectionViewDelegate* delegate;

- (void)mvp_registerClass:(nullable Class)cellClass forCellWithReuseIdentifier:(NSString *)identifier;
- (void)mvp_registerNib:(nullable UINib *)nib forCellWithReuseIdentifier:(NSString *)identifier;
- (void)registNibCell:(NSString*)cell withIdentifier:(NSString*)identifier;
- (Class)collectionViewClass;


@end

NS_ASSUME_NONNULL_END
