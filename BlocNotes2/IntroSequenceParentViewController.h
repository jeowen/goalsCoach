//
//  IntroSequenceParentViewController.h
//  goalsCoach
//
//  Created by Jason Owen on 10/20/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroSequenceParentViewController : UIViewController <UIPageViewControllerDataSource>


@property (strong, nonatomic) UIPageViewController *pageController;
@end
