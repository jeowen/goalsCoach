//
//  DetailViewController.m
//  BlocNotes2
//
//  Created by Jason Owen on 6/8/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "DetailViewController.h"
#import "DataSource.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *noteBodyTextView;
@property (weak, nonatomic) IBOutlet UITextField *goalName;
@property (weak, nonatomic) IBOutlet UISlider *goalValue;

@end

@implementation DetailViewController

- (IBAction)goalValueChanged:(UISlider *)sender {
    int valueOfSlider = self.goalValue.value;
    NSLog(@"value of slider: %d", valueOfSlider);
    // set goalValueDisplay label value to be = slider
    NSString* sliderValueString = [NSString stringWithFormat:@"%i", valueOfSlider];
    self.goalValueDisplay.text = sliderValueString;
}

#pragma mark- Capture text field
- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    NSLog(@"you entered the text: %@", enteredText);
    // update goalName in core data
    // NEXT: set up a delegate protocol (beaming signal) and set up a listener (radio dish) in MasterViewController
    // or somewhere where it can easily save to core data
    // - need a data handling class to update goalName with enteredText
    
}
- (IBAction)textFieldDidFinish:(UITextField *)sender {
    NSString *enteredText = sender.text;
    NSLog(@"you FINISHED the text: %@", enteredText);
    
    [self.detailItem setValue:enteredText forKey:@"goalName"];

}

#pragma mark - Managing the detail item


- (void)setDetailItem:(id)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        // NEXT: retrieve a specific instance
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
        //self.goalName.text = [self.detailItem valueForKey:@"goalName"];
        self.goalName.text = [[self.detailItem valueForKey:@"goalName"] description];
      //  NSLog(@"about to print the goalName: %@", _goalName.text);
        self.goalName.backgroundColor = [UIColor colorWithRed:(204/255.0) green:(229/255.0) blue:(255/255.0) alpha:1] ;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
  
    
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // stage goalName & goalValue & currentDate for saving to Core Data
    
    [self.detailItem setValue:self.goalName.text forKey:@"goalName"];
    
    NSString *existingUpdates = [[self.detailItem valueForKey:@"udpates"] description];
    NSString *updatedUpdates = [NSString stringWithFormat:@"%@, %@:%@", existingUpdates, [NSDate date],self.goalValueDisplay.text];
    [self.detailItem setValue:updatedUpdates forKey:@"updates"];
    
    // save context
    
//    NSError *saveError = nil;
//    
//    if (![self.detailItem.managedObjectContext save:&saveError]) {
//        NSLog(@"Unable to save managed object context.");
//        NSLog(@"%@, %@", saveError, saveError.localizedDescription);
//    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
