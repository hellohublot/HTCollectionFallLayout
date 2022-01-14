//
//  HTViewController.m
//  HTCollectionFallLayout
//
//  Created by hellohublot on 12/18/2018.
//  Copyright (c) 2018 hellohublot. All rights reserved.
//

#import "HTViewController.h"
#import <HTCollectionFallLayout/HTCollectionFallLayout.h>
#import "HTSectionDecorationView.h"

@interface HTViewController () <UICollectionViewDelegate, UICollectionViewDataSource, HTCollectionFallDelegateLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation HTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataSource];
    [self initUserInterface];
}

- (void)initDataSource {
}

- (void)initUserInterface {
    self.collectionView.frame = self.view.bounds;
    [self.view addSubview:self.collectionView];
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        HTCollectionFallLayout *fallLayout = [[HTCollectionFallLayout alloc] init];
        fallLayout.delegate = self;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:fallLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [fallLayout registerClass:[HTSectionDecorationView class] forDecorationViewOfKind:NSStringFromClass([HTSectionDecorationView class])];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class])];
    }
    return _collectionView;
}




- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UICollectionViewCell class]) forIndexPath:indexPath];
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    return cell;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout columnCountForSectionAt:(NSInteger)section {
    return section + 2;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout heightForItemAt:(NSIndexPath *)indexPath {
    return 100 + 10 * indexPath.row;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(10, 10, 100, 10);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout lineSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout interitemSpacingForSectionAtIndex:(NSInteger)section {
    return 10;
}

- (nullable UICollectionViewLayoutAttributes *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout layoutAttributesForDecorationViewInSection:(NSInteger)section sectionContentMinY:(CGFloat)minY sectionContentMaxY:(CGFloat)maxY {
    HTCollectionViewLayoutAttributes *attributes = [HTCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:NSStringFromClass([HTSectionDecorationView class]) withIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    attributes.frame = CGRectMake(0, minY, collectionView.bounds.size.width, maxY - minY - 90);
    attributes.zIndex = -1;
    attributes.model = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];

    return attributes;
}


@end

