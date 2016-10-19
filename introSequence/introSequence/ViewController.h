//
//  ViewController.h
//  introSequence
//
//  Created by Jason Owen on 10/13/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPageViewControllerDataSource>
- (IBAction)startWalkthrough:(id)sender;

@property (strong, nonatomic) UIPageViewController *pageViewController;

@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageBodies;
@property (strong, nonatomic) NSArray *pageFooters;
@property (strong, nonatomic) NSArray *pageImages;

@end

