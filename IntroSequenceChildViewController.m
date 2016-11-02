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
  //  self.headerLabel.text = [NSString stringWithFormat:@"Screen #%d", self.index];
    self.doNotShowButton.hidden = YES;
    self.getStartedButton.hidden = YES;
    
    NSArray *headerLabels = [NSArray arrayWithObjects:@"Welcome to",@"", @"", @"", @"", nil];
    self.headerLabel.text = [headerLabels objectAtIndex:self.index];
    NSArray *bodyLabels = [NSArray arrayWithObjects:@"Goals Coach!",@"Let's get started:",@"Choose a goal that is",@"A goal that",@"A goal you can work toward each and every day", nil];
    self.bodyLabel.text = [bodyLabels objectAtIndex:self.index];
    
    NSArray *lowerLabels = [NSArray arrayWithObjects:@"", @"Think of something you really want to keep track of",@"Important to YOU", @"would help you to", @"", nil];
    self.lowerLabel.text = [lowerLabels objectAtIndex:self.index];
    self.lowerLabel.numberOfLines = 0;
    [self.lowerLabel sizeToFit];
    
    
     NSArray *footerLabels = [NSArray arrayWithObjects:@"",@"every day.", @"", @"live life more fully.", @"", nil];
    self.footerLabel.text = [footerLabels objectAtIndex:self.index];
    
    self.view.backgroundColor = [UIColor colorWithRed:(57/255.0) green:(115/255.0) blue:(172/255.0) alpha:1];
    
    NSLog(@"self.index = %ld", self.index);
    if (self.index == 4){
        self.doNotShowButton.hidden = NO;
        self.getStartedButton.hidden = NO;
    }

    // hide buttons or not
    // unless it's the last page, hide the buttons
    // button.hidden = YES;
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"IntroSequenceTargetGrayscale.jpg"]];
//    [self.view addSubview:backgroundImage];
    

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
