//
//  DCApper.m
//  xxxviper
//
//  Created by 张超 on 2018/12/25.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "DCApper.h"

@implementation DCApper

- (void)mvp_setupView:(__kindof UIView *)view
{
    switch (view.tag) {
        case XXVViewTagManageView:
        {
            [view setBackgroundColor:[UIColor clearColor]];
            [self setupCollectionView:view];
            break;
        }
        case XXVViewTagContentView:
        {
            break;
        }
        default:
            break;
    }
}

- (void)setupCollectionView:(UICollectionView*)collectView
{
    UICollectionViewFlowLayout* f =  (UICollectionViewFlowLayout*)[collectView collectionViewLayout];
    [f setItemSize:CGSizeMake(100, 100)];
    [f setSectionInset:UIEdgeInsetsMake(10, 10, 10, 10)];
    [f setMinimumLineSpacing:10];
    [f setMinimumInteritemSpacing:10];
    
    [f setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [collectView setAlwaysBounceHorizontal:YES];
//    [collectView setAlwaysBounceVertical:YES];
}

@end
