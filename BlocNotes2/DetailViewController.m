//
//  DetailViewController.m
//  BlocNotes2
//
//  Created by Jason Owen on 6/8/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "DetailViewController.h"
#import "DataSource.h"
#import "Event.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *noteBodyTextView;
@property (weak, nonatomic) IBOutlet UITextField *goalName;
@property (weak, nonatomic) IBOutlet UISlider *goalValue;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end




@implementation DetailViewController

- (IBAction)goalValueChanged:(UISlider *)sender {
    int valueOfSlider = self.goalValue.value;
    NSLog(@"value of slider: %d", valueOfSlider);
    // set goalValueDisplay label value to be = slider
    NSString* sliderValueString = [NSString stringWithFormat:@"%i", valueOfSlider];
    self.goalValueDisplay.text = sliderValueString;
    [self.goalName resignFirstResponder];
    
    // store to core data
    //self.detailItem.goalName = enteredText;
    
    // need jsonDict.  get text from core data
    // convert text into json Dict
    NSString *jsonString = self.detailItem.updates;
    
    //jsonText should be in format:
    //  { "date":"13:44:59GMT", "goalValue":70 }
   
    if (!([jsonString length] == 0)){
        NSError *jsonError;
        NSData *objectData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                             options:NSJSONReadingMutableContainers
                                                               error:&jsonError];
    }
    
    // get current date in "13:44:59GMT" format
    // write date: current date, goalValue = 70 into jsonResponse
    // convert jsonResponse back into JSON string
    // write string to core data for updates
    
}

#pragma mark- Capture text field
- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    NSLog(@"you entered the text: %@", enteredText);
    
}
- (IBAction)textFieldDidFinish:(UITextField *)sender {
    NSString *enteredText = sender.text;
    NSLog(@"you FINISHED the text: %@", enteredText);
    
    self.detailItem.goalName = enteredText;
    
  
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
        
      // get string of previous updates for this goal
      // get date of last update
      // if date of last update is same calendar day, show last update
      // from slider value
     
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
    
    //The setup code for Tap Gesture Recognizer
    // Create and initialize a tap gesture
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToTapGesture:)];
    
    // Specify that the gesture must be a single tap
    tapRecognizer.numberOfTapsRequired = 1;
    
    // Add the tap gesture recognizer to the view
    [self.view addGestureRecognizer:tapRecognizer];
    
    // Do any additional setup after loading the view, typically from a nib
}

- (void) respondToTapGesture:(UITapGestureRecognizer *)recognizer  {
    // do something here
    [self.goalName resignFirstResponder];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    // stage goalName & goalValue & currentDate for saving to Core Data
    
    //NSString *existingUpdates = [[self.detailItem valueForKey:@"udpates"] description];
    //NSString *updatedUpdates = [NSString stringWithFormat:@"%@, %@:%@", existingUpdates, [NSDate date],self.goalValueDisplay.text];
    //[self.detailItem setValue:updatedUpdates forKey:@"updates"];
    
    // save context
    
    NSError *saveError = nil;
    
    if (![self.detailItem.managedObjectContext save:&saveError]) {
        NSLog(@"Unable to save managed object context.");
        NSLog(@"%@, %@", saveError, saveError.localizedDescription);
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
