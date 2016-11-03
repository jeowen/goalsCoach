//
//  IntroSequenceChildViewController.h
//  goalsCoach
//
//  Created by Jason Owen on 10/18/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroSequenceChildViewController : UIViewController 

@property (strong, nonatomic) IBOutlet UILabel *headerLabel;
@property (strong, nonatomic) IBOutlet UILabel *bodyLabel;
@property (strong, nonatomic) IBOutlet UILabel *footerLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowerLabel;
@property (strong, nonatomic) IBOutlet UIImageView *introImage;
@property (weak, nonatomic) IBOutlet UIButton *doNotShowButton;
@property (weak, nonatomic) IBOutlet UIButton *getStartedButton;

@property (assign, nonatomic) NSInteger *index;


@end