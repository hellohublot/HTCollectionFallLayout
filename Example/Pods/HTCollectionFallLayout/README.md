- 支持自定义 UICollectionView 每个 section 的属性，比如背景颜色
- 支持瀑布流

<img src="./Example/example.png" width="400">

## Usage

[点击查看完整示例 Example](./Example/HTCollectionFallLayout/HTViewController.m)

```ruby
pod'ObjectiveRecord', ::git => 'https://github.com/hellohublot/HTCollectionFallLayout.git'
```
```objective-c
- (void)registerClass:(nullable Class)viewClass forDecorationViewOfKind:(NSString *)elementKind;

- (nullable UICollectionViewLayoutAttributes *)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout layoutAttributesForDecorationViewInSection:(NSInteger)section sectionContentMinY:(CGFloat)minY sectionContentMaxY:(CGFloat)maxY {
	HTCollectionViewLayoutAttributes *attributes = [HTCollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:NSStringFromClass([HTSectionDecorationView class]) withIndexPath:[NSIndexPath indexPathForRow:0 inSection:section]];
    attributes.frame = CGRectMake(0, minY, collectionView.bounds.size.width, maxY - minY - 10);
    attributes.zIndex = -1;
    attributes.model = [UIColor blueColor];
    return attributes;
}

- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    HTCollectionViewLayoutAttributes *attributes = (HTCollectionViewLayoutAttributes *)layoutAttributes;
    self.backgroundColor = attributes.model;
}
```

## Author

hellohublot, hublot@aliyun.com
