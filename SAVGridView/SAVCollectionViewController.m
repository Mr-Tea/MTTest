//
//  SAVCollectionViewController.m
//  SAVGridView
//
//  Created by Matthew Tea on 9/17/15.
//  Copyright © 2015 savvy apps. All rights reserved.
//

#import "SAVCollectionViewController.h"
#import "SAVViewController.h"

@interface SAVCollectionViewController ()
@property (nonatomic, copy, readwrite) NSMutableDictionary *visibleSupplementaryViews;
@end

@implementation SAVCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (KRLCollectionViewGridLayout *)layout
{
    return (id)self.collectionView.collectionViewLayout;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    
//    [self setUpHeaders];
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 25;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section % 2 == 1) {
        cell.contentView.backgroundColor = [UIColor blueColor];
    } else {
        cell.contentView.backgroundColor = [UIColor redColor];
    }
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if ([scrollView isMemberOfClass:[UICollectionView class]]) {
        [((SAVViewController*)self.parentViewController) scrolled:scrollView];
//        self.xScrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, self.xScrollView.contentOffset.y);
//        self.yScrollView.contentOffset = CGPointMake(self.yScrollView.contentOffset.x, scrollView.contentOffset.y);
    }
}



////- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
////{
////    NSMutableDictionary *viewsForKind = self.visibleSupplementaryViews[elementKind];
////    [viewsForKind removeObjectForKey:indexPath];
////}
//
//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    NSValue *value = self.sectionInsets[@(section)];
//    if (value == nil) {
//        return [(id)collectionViewLayout sectionInset];
//    }
//    return [value UIEdgeInsetsValue];
//}
//
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout lineSpacingForSectionAtIndex:(NSInteger)section
{
    NSNumber *value = self.lineSpacings[@(section)];
    if (value == nil) {
        return [(id)collectionViewLayout lineSpacing];
    }
    return 10;//[value doubleValue];
}
//
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout interitemSpacingForSectionAtIndex:(NSInteger)section
{
    NSNumber *value = self.interitemSpacings[@(section)];
    if (value == nil) {
        return [(id)collectionViewLayout interitemSpacing];
    }
    return 10;//[value doubleValue];
}
//
////- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceLengthForHeaderInSection:(NSInteger)section
////{
////    NSNumber *value = self.headerLengths[@(section)];
////    if (value == nil) {
////        return [(id)collectionViewLayout headerReferenceLength];
////    }
////    return [value doubleValue];
////}
//
////- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceLengthForFooterInSection:(NSInteger)section
////{
////    NSNumber *value = self.footerLengths[@(section)];
////    if (value == nil) {
////        return [(id)collectionViewLayout footerReferenceLength];
////    }
////    return [value doubleValue];
////}
//
//- (NSInteger)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout numberItemsPerLineForSectionAtIndex:(NSInteger)section
//{
////    NSNumber *value = self.columnCounts[@(section)];
////    if (value == nil) {
////        return [(id)collectionViewLayout numberOfItemsPerLine];
////    }
////    return [value integerValue];
//    return 3;
//}
//
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout aspectRatioForItemsInSectionAtIndex:(NSInteger)section
//{
//    return 1;
////    NSNumber *value = self.aspectRatios[@(section)];
////    if (value == nil) {
////        return [(id)collectionViewLayout aspectRatio];
////    }
////    return [value doubleValue];
//}



@end
