//
//  SAVCollectionViewController.h
//  SAVGridView
//
//  Created by Matthew Tea on 9/17/15.
//  Copyright © 2015 savvy apps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KRLCollectionViewGridLayout.h"

@interface SAVCollectionViewController : UICollectionViewController <KRLCollectionViewDelegateGridLayout>

@property (nonatomic, copy) NSArray *items;

@property (nonatomic, copy, readonly) NSMutableDictionary *visibleSupplementaryViews;

@property (nonatomic, copy, readonly) NSMutableDictionary *sectionInsets;
@property (nonatomic, copy, readonly) NSMutableDictionary *lineSpacings;
@property (nonatomic, copy, readonly) NSMutableDictionary *interitemSpacings;
@property (nonatomic, copy, readonly) NSMutableDictionary *headerLengths;
@property (nonatomic, copy, readonly) NSMutableDictionary *footerLengths;
@property (nonatomic, copy, readonly) NSMutableDictionary *columnCounts;
@property (nonatomic, copy, readonly) NSMutableDictionary *aspectRatios;

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
