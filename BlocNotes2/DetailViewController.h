//
//  DetailViewController.h
//  BlocNotes2
//
//  Created by Jason Owen on 6/8/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *leftAnchor;
@property (weak, nonatomic) IBOutlet UITextField *rightAnchor;

@property (weak, nonatomic) IBOutlet UILabel *goalValueDisplay;
@end

