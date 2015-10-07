//
//  SAVViewController.m
//  SAVGridView
//
//  Created by Matthew Tea on 9/17/15.
//  Copyright © 2015 savvy apps. All rights reserved.
//

#import "SAVViewController.h"
#import "SAVCollectionViewController.h"
#import "KRLCollectionViewGridLayout.h"

@interface SAVViewController ()
@property (nonatomic, weak) SAVCollectionViewController* collectionVC;

@end

@implementation SAVViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    [self setUpHeaders];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    self.collectionVC = segue.destinationViewController;
}

 -(void)setUpHeaders {
     
     NSInteger numItems = [self.collectionVC collectionView:self.collectionVC.collectionView numberOfItemsInSection:0];
     
     CGFloat xWidth = 0;
     for (NSInteger i = 0; i < numItems; i++) {
         UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 130)];//[self.collectionVC collectionView: self.collectionVC.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]].contentView;
//         view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, [((KRLCollectionViewGridLayout*)self.collectionVC.collectionViewLayout) cellSizeInSection:0].width, [(KRLCollectionViewGridLayout*)self.collectionVC.collectionViewLayout cellSizeInSection:0].height);
         
         view.backgroundColor = [UIColor clearColor];

         UIView*subview = [[UIView alloc] initWithFrame:CGRectMake(5, 5, view.frame.size.width - 10, view.frame.size.height - 10)];
         subview.backgroundColor = [UIColor redColor];
         
         [view addSubview:subview];
         
         view.frame = CGRectMake(i*view.frame.size.width, 0, view.frame.size.width, 62);
         xWidth = i*view.frame.size.width + view.frame.size.width;
         [self.xScrollView addSubview:view];
     }
     [self.xScrollView setContentSize:CGSizeMake(xWidth, 62)];
     
     CGFloat yHeight = 0;
     for (NSInteger i = 0; i < numItems; i++) {
         UIView* view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 130, 130)];
         //         UIView* view = [self.collectionVC collectionView: self.collectionVC.collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]].contentView;
//         view.frame = CGRectMake(view.frame.origin.x, view.frame.origin.y, [(KRLCollectionViewGridLayout*)self.collectionVC.collectionViewLayout cellSizeInSection:0].width, [(KRLCollectionViewGridLayout*)self.collectionVC.collectionViewLayout cellSizeInSection:0].height);

         view.backgroundColor = [UIColor clearColor];
         
         UIView*subview = [[UIView alloc] initWithFrame:CGRectMake(5, 5, view.frame.size.width - 10, view.frame.size.height - 10)];
         subview.backgroundColor = [UIColor purpleColor];
         
         [view addSubview:subview];
         
         view.frame = CGRectMake(0, i*view.frame.size.height, 115, view.frame.size.height);
         yHeight = i*view.frame.size.height + view.frame.size.height;
         [self.yScrollView addSubview:view];
     }
     [self.yScrollView setContentSize:CGSizeMake(115, yHeight)];
     
 }
 
-(void)scrolled:(UIScrollView *)scrollView {
        if ([scrollView isMemberOfClass:[UICollectionView class]]) {
            self.xScrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, self.xScrollView.contentOffset.y);
            self.yScrollView.contentOffset = CGPointMake(self.yScrollView.contentOffset.x, scrollView.contentOffset.y);
        }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    self.collectionVC.collectionView.contentOffset = CGPointMake(self.collectionVC.collectionView.contentOffset.x, self.xScrollView.contentOffset.y);
    self.collectionVC.collectionView.contentOffset = CGPointMake(self.yScrollView.contentOffset.x, self.collectionVC.collectionView.contentOffset.y);
}

@end
