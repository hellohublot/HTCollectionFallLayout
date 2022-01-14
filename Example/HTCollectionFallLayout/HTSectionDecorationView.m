//
//  HTSectionDecorationView.m
//  HTCollectionFallLayout_Example
//
//  Created by hublot on 2022/1/15.
//  Copyright © 2022 hellohublot. All rights reserved.
//

#import "HTSectionDecorationView.h"
#import <HTCollectionFallLayout/HTCollectionFallLayout.h>

@implementation HTSectionDecorationView

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    HTCollectionViewLayoutAttributes *attributes = (HTCollectionViewLayoutAttributes *)layoutAttributes;
    self.backgroundColor = attributes.model;
}

@end
