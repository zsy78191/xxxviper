//
//  XXVEmptyMiddleware.h
//  xxxviper
//
//  Created by 张超 on 2018/12/23.
//  Copyright © 2018 orzer. All rights reserved.
//

#import "XXVBaseMiddleware.h"

NS_ASSUME_NONNULL_BEGIN
@class UIImage,UIColor,UIButton,UIView;
@interface XXVEmptyMiddleware : XXVBaseMiddleware

- (NSString*)titleForEmptyTitle;
- (NSDictionary*)attributesForEmptyTitle;

- (NSString*)titleForEmptyDescription;
- (NSDictionary*)attributesForEmptyDescription;

- (UIImage*)image;
- (UIColor*)imageTintColor;

- (NSString*)buttonTitleForState:(NSUInteger)state;
- (NSDictionary*)buttonTitleAttributesForState:(NSUInteger)state;

- (void)didTapButton:(UIButton *)button;
- (UIView *)customView;

@end

NS_ASSUME_NONNULL_END
