//
//  XXVOutputProtocol.g.h
//  xxxviper
//
//  Created by 张超 on 2018/12/18.
//  Copyright © 2018 orzer. All rights reserved.
//

#ifndef XXVOutputProtocol_g_h
#define XXVOutputProtocol_g_h

NS_ASSUME_NONNULL_BEGIN

@class UIView,UITableView,UICollectionView;
@class XXVEmptyMiddleware;
@protocol XXVOutputProtocol,XXVModelProtocol,XXVInteractorProtocol,XXVInteractorProtocol_private;
@protocol XXVInputProtocol <NSObject>

- (NSUInteger)numberOfSections;
- (NSUInteger)numberOfRowsInSection:(NSUInteger)section;
- (id)allModels;

@required

- (NSUInteger)mvp_addModel:(id<XXVModelProtocol>)model;
- (NSUInteger)mvp_insertModel:(id<XXVModelProtocol>)model atIndex:(NSUInteger)idx;
- (NSIndexPath*)mvp_indexPathWithModel:(id<XXVModelProtocol>)model;
- (BOOL)containsModel:(id<XXVModelProtocol>)model;
- (id<XXVModelProtocol>)mvp_deleteModelAtIndexPath:(NSIndexPath*)path;
- (void)mvp_deleteModel:(id<XXVModelProtocol>)model;
- (void)mvp_updateModel:(id<XXVModelProtocol>)model atIndexPath:(NSIndexPath*)path;
- (void)mvp_moveModelFromIndexPath:(NSIndexPath*)path1 toPath:(NSIndexPath*)path2;
- (void)mvp_cleanAll;
- (id<XXVModelProtocol>)mvp_modelAtIndexPath:(NSIndexPath*)path;
- (NSUInteger)mvp_count;
@property (nonatomic, weak) id<XXVOutputProtocol> outputer;
@property (nonatomic, weak) id<XXVInteractorProtocol,XXVInteractorProtocol_private> interactor;
@property (nonatomic, assign) NSUInteger complexSection;

@optional
- (nullable NSString*)mvp_identifierForModel:(id<XXVModelProtocol>)model;

@end

@protocol XXVCoreDataInputProtocol <XXVInputProtocol>

@optional
- (NSArray<NSSortDescriptor *> *) sortDescriptors;
- (NSPredicate*)predicate;
- (NSString*)sectionKeyPath;
- (NSUInteger)fetchLimitCount; //defalut is 0 ，no limit
- (void)rebuildFetch;

@end

@protocol XXVOutputProtocol <NSObject>

- (__kindof UIView*)outputView;
@property (nonatomic, weak) id<XXVInputProtocol> inputer;
@property (nonatomic, assign) BOOL canMove;

@property (nonatomic, assign) BOOL scrollToInsertPosition;
@property (nonatomic, assign) BOOL dragHideKeyboard;

- (void)enableAnimation;
- (void)disableAnimation;

- (void)beginUpdates;
- (void)endUpdates;
- (void)reloadData;

- (void)insertAtIndexPath:(NSIndexPath*)path;
- (void)deleleAtIndexPath:(NSIndexPath*)path;
- (void)updateAtIndexPath:(NSIndexPath*)path;
- (void)insertAtIndexPaths:(NSArray*)paths;
- (void)deleleAtIndexPaths:(NSArray*)paths;
- (void)updateAtIndexPaths:(NSArray*)paths;

- (void)deleteAll;

- (void)insertSectionAtIndex:(NSUInteger)idx;
- (void)deleteSectionAtIndex:(NSUInteger)idx;
- (void)setEmpty:(__kindof XXVEmptyMiddleware*)empty;

- (void)moveFromIndexPath:(NSIndexPath*)fidx toIndexPath:(NSIndexPath*)tidx;

@property (nonatomic, strong) void(^registBlock)(id output);
- (void)registNibCell:(NSString*)cell withIdentifier:(NSString*)identifier;

@optional
- (void)performBatchUpdates:(void (^ _Nullable)(void))updates completion:(void (^ _Nullable)(BOOL finished))completion;
- (void)setEditing:(BOOL)editing animated:(BOOL)animated;

@end

@protocol XXVTableViewOutputProtocol <XXVOutputProtocol>
@property (nonatomic, strong) UITableView* tableview;
@end

@protocol XXVCollectionViewOutputProtocol <XXVOutputProtocol>
@property (nonatomic, strong) UICollectionView* collectionView;
@end

NS_ASSUME_NONNULL_END

#endif /* XXVOutputProtocol_g_h */


