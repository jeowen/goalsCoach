//
//  DetailViewController.m
//  BlocNotes2
//
//  Created by Jason Owen on 6/8/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "DetailViewController.h"
#import "DataSource.h"
#import "Event+CoreDataClass.h"
#import "GoalValue+CoreDataClass.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *noteBodyTextView;
@property (weak, nonatomic) IBOutlet UITextField *goalName;
@property (weak, nonatomic) IBOutlet UISlider *goalValue;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@property (nonatomic, assign) BOOL sliderChanged;

@end




@implementation DetailViewController



- (IBAction)goalValueChanged:(UISlider *)sender {
    int valueOfSlider = self.goalValue.value;
    // [self.goalValue setContinuous: NO];
    
    NSLog(@"value of slider: %d", valueOfSlider);
    // set goalValueDisplay label value to be = slider
    NSString* sliderValueString = [NSString stringWithFormat:@"%i", valueOfSlider];
    self.goalValueDisplay.text = sliderValueString;
    [self.goalName resignFirstResponder];
    
    
    self.sliderChanged = YES;
    
    // store to core data
    //self.detailItem.goalName = enteredText;
    // only when touch up inside and touch up outside gesture recognizers fire
    
 
    
}
- (IBAction)goalValueTouchUpInside:(id)sender {
    // THIS IS WHERE WE STORE SLIDE TO CORE DATA
    NSLog(@"\n\nTouchUpInside detected ++++++++++>>>>>");
    // NSString * tempString = @"touchUpInside";
   //  [self manageGoalUpdates:tempString];
    
}
- (IBAction)goalValueTouchUpOutside:(id)sender {
    // THIS IS WHERE WE STORE SLIDE TO CORE DATA
    NSLog(@"\n\nTouchUpOutside detected ******>>>>>");
   //  NSString * tempString = @"touchUpOutside";
   //  [self manageGoalUpdates:tempString];
}

- (IBAction)goalValueEditingDidEnd:(id)sender {
    // NSString * tempString = @"editingDidEnd";
    // [self manageGoalUpdates:tempString];
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
    
    // SET SLIDER VALUE TO PREVIOUS BASELINE, or 50 if NO PREVIOUS UPDATES TO GOAL
    // - 1. Get array of previous slider values from GoalValue Data Model Entity
    // - 2. Get most recent goalValue from this array
    // - 3. initialize slider to this goalValue
    
    NSSet *goalValueHistory = self.detailItem.goalValues;
    NSLog(@"############## The set has %li elements", [goalValueHistory count]);
    NSArray *result = [[goalValueHistory allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"day" ascending:YES]]];

    for (GoalValue * object in result){
       //  NSLog(@"---array value = %@\n", object);
        NSLog(@"Object - parameter test date: %@\n     day: %@\n     value: %@\n", object.date, object.day, object.value);
    }
    
//    for (id item in goalValueHistory) {
//        NSLog(@"goalValueHistory contains item: %@", item);
//    }
}

- (void) respondToTapGesture:(UITapGestureRecognizer *)recognizer  {
    // do something here
    [self.goalName resignFirstResponder];
}

- (void) viewWillDisappear:(BOOL)animated {
    // THIS METHOD IS OVER-WRITTEN TO:
    //  -- STORE GOAL VALUE (IF SLIDER HAS BEEN CHANGED) to CORE DATA
    
    // GET THE CONTEXT
    NSManagedObjectContext *context = [self.detailItem managedObjectContext];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"GoalValue" inManagedObjectContext:context];
    GoalValue *goalValue = (GoalValue *)[NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
    
    // Convert current date (a full timestamp) into a specific day, i.e., YYYYMMDD
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate *dt = [NSDate date];
    NSString *dateAsString = [formatter stringFromDate:dt];
    
    //NSLog(@"Date as string in yyyyMMdd format = %@\n", dateAsString);
    
    // ASSIGN VALUES TO MEMORY for GoalValue Data Model Entity
    
    // cast string to number
    NSNumber  *dayAsNumber = [NSNumber numberWithInteger: [dateAsString integerValue]];
    NSLog(@"dayAsNumber yyyyMMdd after casting into NSNumber = %@", dayAsNumber);
    
    if (self.sliderChanged == YES){
        // slider was changed, and about to store data
        NSLog(@"Slider was changed, about to store data!!!");
        
        // update an existing value in core data or insert a new value
        
           // 1. see if there is an exisitng value of dayAsNumber already in core data
            NSSet *goalValueHistory = self.detailItem.goalValues;
            // NSLog(@"############## The set has %li elements", [goalValueHistory count]);
            NSArray *result = [[goalValueHistory allObjects] sortedArrayUsingDescriptors:[NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"day" ascending:YES]]];
        
            _Bool updated = NO;
        
        
            for (GoalValue * object in result){
                //  compare object.day with dayAsNumber
                //  if a match is found overwrite, this value of object.day
                NSLog(@"Object - parameter test date: %@\n     day: %@\n     value: %@\n", object.date, object.day, object.value);
                if (dayAsNumber == object.day){
                    goalValue.value = @(self.goalValue.value);
                    goalValue.date = [NSDate date];
                    updated = YES;
                }
            }
            if (updated == NO){
                // do something
                
                goalValue.day = dayAsNumber;
                goalValue.value = @(self.goalValue.value);
                goalValue.date = [NSDate date];
                
                // ASSIGN goalValue to detailItem Data Model Entity
                [self.detailItem addGoalValuesObject:goalValue];
            }
        

        
        
       //  self.detailItem.goalValues = NSSet (not ordered; cannot have duplicates); convert to array
        //    to iterate through it
        
        
        [super viewWillDisappear:animated];
     
        
        NSError *saveError = nil;
        
        // SAVE MANAGED OBJECT CONTEXT
        if (![self.detailItem.managedObjectContext save:&saveError]) {
            NSLog(@"Unable to save managed object context.");
            NSLog(@"%@, %@", saveError, saveError.localizedDescription);
        }
        
    }// #END sliderChanged == YES
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
