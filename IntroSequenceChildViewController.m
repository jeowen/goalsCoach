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

- (void) viewDidLoad{
  //  self.headerLabel.text = [NSString stringWithFormat:@"Screen #%d", self.index];
//    self.doNotShowButton.hidden = YES;
//    self.getStartedButton.hidden = YES;
    
    NSArray *headerLabels = [NSArray arrayWithObjects:@"Welcome to",@"", @"", @"", @"", nil];
    self.headerLabel.text = [headerLabels objectAtIndex:self.index];
    
    self.headerLabel.numberOfLines = 0;
    self.headerLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    ;
    NSArray *bodyLabels = [NSArray arrayWithObjects:@"Goals Coach!",@"Let's get started:",@"Choose a goal that is",@"A goal that",@"A goal you can work toward each and every day", nil];
    self.bodyLabel.text = [bodyLabels objectAtIndex:self.index];
    self.bodyLabel.numberOfLines = 0;
    self.bodyLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSArray *lowerLabels = [NSArray arrayWithObjects:@"", @"Think of something you really want to keep track of", @"Important to YOU", @"would help you to", @"", nil];
    self.lowerLabel.text = [lowerLabels objectAtIndex:self.index];
    self.lowerLabel.numberOfLines = 0;
    self.lowerLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    
     NSArray *footerLabels = [NSArray arrayWithObjects:@"",@"every day.", @"", @"live life more fully.", @"", nil];
    self.footerLabel.text = [footerLabels objectAtIndex:self.index];
    self.footerLabel.numberOfLines = 0;
    self.footerLabel.lineBreakMode = NSLineBreakByWordWrapping;
    
    self.view.backgroundColor = [UIColor colorWithRed:(57/255.0) green:(115/255.0) blue:(172/255.0) alpha:1];
    
    NSLog(@"self.index = %ld", self.index);
    if (self.index == 4){
        self.doNotShowButton.hidden = NO;
        self.getStartedButton.hidden = NO;
        self.doNotShowButton.layer.cornerRadius = 15;
        self.getStartedButton.layer.cornerRadius = 15;
        self.doNotShowButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.getStartedButton.layer.borderColor = [UIColor blackColor].CGColor;
        self.doNotShowButton.layer.borderWidth = 1;
        self.getStartedButton.layer.borderWidth = 1;
        
        // respond to tap gesture to close the IntroSequence
        // Create and initialize a tap gesture
        UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                                 initWithTarget:self action:@selector(respondToTapGesture:)];
        
        // Specify that the gesture must be a single tap
        tapRecognizer.numberOfTapsRequired = 1;
        
        // Add the tap gesture recognizer to the view
        [self.view addGestureRecognizer:tapRecognizer];
        
        
    }

    

    

}
//The event handling method
- (void)respondToTapGesture:(UITapGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[recognizer.view superview]];
    NSLog(@"view has been tapped on button screen");
    // alert presentingViewController that it needs to dismiss this view
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasSeenIntroSequence"];
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)respondToGetStarted:(id)sender {
    NSLog(@"Get Started button was pressed");
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasSeenIntroSequence"];
    [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
}
- (IBAction)respondToDoNotShowAgain:(id)sender {
    NSLog(@"Do Not Show Again was pressed");
      [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"doNotShowAgain"];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"hasSeenIntroSequence"];
     [[self presentingViewController] dismissViewControllerAnimated:NO completion:nil];
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
