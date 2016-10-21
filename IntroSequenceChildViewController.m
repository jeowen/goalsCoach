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



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
