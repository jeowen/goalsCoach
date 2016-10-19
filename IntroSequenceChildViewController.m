//
//  IntroSequenceChildViewController.m
//  goalsCoach
//
//  Created by Jason Owen on 10/18/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "IntroSequenceChildViewController.h"

@interface IntroSequenceChildViewController ()

@end

@implementation IntroSequenceChildViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    
    self.pageController.dataSource = self;
    [[self.pageController view] setFrame:[[self view] bounds]];
    
    IntroSequenceChildViewController *initialViewController = [self viewControllerAtIndex:0];
    
    NSArray *viewControllers = [NSArray arrayWithObject:initialViewController];
    
    [self.pageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageController];
    [[self view] addSubview:[self.pageController view]];
    [self.pageController didMoveToParentViewController:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - required UIPageViewController protocol methods
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(nonnull UIViewController *)viewController{
    
    NSUInteger index = [(IntroSequenceChildViewController *)viewController index];
    if (index == 0){
        return nil;
    }
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    NSUInteger index = [(IntroSequenceChildViewController *)viewController index];
    index++;
    if (index ==5) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (IntroSequenceChildViewController *)viewControllerAtIndex:(NSUInteger)index {
    
    IntroSequenceChildViewController *childViewController = [[IntroSequenceChildViewController alloc] initWithNibName:@"IntroSequenceChildViewController" bundle:nil];
    childViewController.index = index;
    
    return childViewController;
    
}


- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController {
    // The number of items reflected in the page indicator.
    return 5;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController {
    // The selected item reflected in the page indicator.
    return 0;
}

- (void) viewDidAppear:(BOOL)animated{
    self.headerLabel.text = [NSString stringWithFormat:@"Screen #%d", self.index];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
