//
//  DataSource.m
//  goalsCoach
//
//  Created by Jason Owen on 5/2/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "DataSource.h"
#import "Goals.h"

@interface DataSource ()

@property (nonatomic, strong) NSArray *goalItems;

@end

@implementation DataSource

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype) init {
    self = [super init];
    
    if (self) {
        [self addExampleData];
    }
    
    return self;
}

- (void) addExampleData {
    NSMutableArray *exampleGoalItems = [NSMutableArray array];
    // add 3 sample goals
   // GOAL # 1
       NSString *goalName1 = [NSString stringWithFormat:@"My Distress"];
       NSString *goalDescription1 = @"How distressed am I feeling today?";
       NSNumber *timestampCreated1 = [NSNumber numberWithInt:2147483647];
       NSNumber *timestampLastUpdated1 = [NSNumber numberWithInt:2147483680];
       NSString *lowAnchorDescription1 = @"0";
       NSString *highAnchorDesription1 = @"10";
       NSDictionary *updateValues1 = @{
                                      @"2147483680":@"80",
                                      @"2147483640":@"100"
                                      };
       
       Goals *goal = [[Goals alloc] init];
       goal.goalName = goalName1;
       goal.goalDescription = goalDescription1;
       goal.timestampCreated = timestampCreated1;
       goal.timestampLastUpdated = timestampLastUpdated1;
       goal.lowAnchorDescription = lowAnchorDescription1;
       goal.highAnchorDescription = highAnchorDesription1;
       goal.updateValues = updateValues1;
       
       [exampleGoalItems addObject:goal];
       //
       //NSTimeInterval timeStamp = [[NSDate date] timeIntervalSince1970];
       //// NSTimeInterval is defined as double
       //NSNumber *timeStampObj = [NSNumber numberWithDouble: timeStamp];
   
    // GOAL # 2
    NSString *goalName2 = [NSString stringWithFormat:@"My Parenting"];
    NSString *goalDescription2 = @"How am I doing today?";
    NSNumber *timestampCreated2 = [NSNumber numberWithInt:2147483647];
    NSNumber *timestampLastUpdated2 = [NSNumber numberWithInt:2147483680];
    NSString *lowAnchorDescription2 = @"Not Good";
    NSString *highAnchorDesription2 = @"Angelic";
    NSDictionary *updateValues2 = @{
                                   @"2147483680":@"40",
                                   @"2147483640":@"70"
                                   };
    
    Goals *goal2 = [[Goals alloc] init];
    goal2.goalName = goalName2;
    goal2.goalDescription = goalDescription2;
    goal2.timestampCreated = timestampCreated2;
    goal2.timestampLastUpdated = timestampLastUpdated2;
    goal2.lowAnchorDescription = lowAnchorDescription2;
    goal2.highAnchorDescription = highAnchorDesription2;
    goal2.updateValues = updateValues2;
    
    [exampleGoalItems addObject:goal2];

    // GOAL # 3
    NSString *goalName3 = [NSString stringWithFormat:@"My Exercise"];
    NSString *goalDescription3 = @"How active am I?";
    NSNumber *timestampCreated3 = [NSNumber numberWithInt:2147483647];
    NSNumber *timestampLastUpdated3 = [NSNumber numberWithInt:2147483680];
    NSString *lowAnchorDescription3 = @"0 steps";
    NSString *highAnchorDesription3 = @"10,000+";
    NSDictionary *updateValues3 = @{
                                    @"2147483680":@"0",
                                    @"2147483640":@"100"
                                    };
    
    Goals *goal3 = [[Goals alloc] init];
    goal3.goalName = goalName3;
    goal3.goalDescription = goalDescription3;
    goal3.timestampCreated = timestampCreated3;
    goal3.timestampLastUpdated = timestampLastUpdated3;
    goal3.lowAnchorDescription = lowAnchorDescription3;
    goal3.highAnchorDescription = highAnchorDesription3;
    goal3.updateValues = updateValues3;
    
    [exampleGoalItems addObject:goal3];
   
    
    self.goalItems = exampleGoalItems;
}
@end
