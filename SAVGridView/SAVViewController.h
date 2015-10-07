//
//  SAVViewController.h
//  SAVGridView
//
//  Created by Matthew Tea on 9/17/15.
//  Copyright © 2015 savvy apps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SAVViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView* xScrollView;
@property (nonatomic, weak) IBOutlet UIScrollView* yScrollView;



-(void)scrolled:(UIScrollView*)scrollView;

@end
