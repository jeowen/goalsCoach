//
//  PageContentViewController.h
//  introSequence
//
//  Created by Jason Owen on 10/17/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PageContentViewController : UIViewController

@property (nonatomic, weak) IBOutlet UILabel *welcomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *headerLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *footerLabel;
@property (weak, nonatomic) IBOutlet UIImageView *introImage;


@property NSUInteger pageIndex;
@property NSString *welcomeText;
@property NSString *headerText;
@property NSString *bodyText;
@property NSString *footerText;
@property NSString *imageFile;

@end
