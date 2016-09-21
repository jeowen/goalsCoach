//
//  Event+CoreDataProperties.h
//  goalsCoach
//
//  Created by Jason Owen on 9/19/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "Event+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Event (CoreDataProperties)

+ (NSFetchRequest<Event *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *dateCreated;
@property (nullable, nonatomic, copy) NSString *goalName;
@property (nullable, nonatomic, copy) NSString *highAnchor;
@property (nullable, nonatomic, copy) NSString *lowAnchor;
@property (nullable, nonatomic, copy) NSDate *timeStamp;
@property (nullable, nonatomic, copy) NSString *updates;
@property (nullable, nonatomic, retain) NSSet<GoalValue *> *goalValues;

@end

@interface Event (CoreDataGeneratedAccessors)

- (void)addGoalValuesObject:(GoalValue *)value;
- (void)removeGoalValuesObject:(GoalValue *)value;
- (void)addGoalValues:(NSSet<GoalValue *> *)values;
- (void)removeGoalValues:(NSSet<GoalValue *> *)values;

@end

NS_ASSUME_NONNULL_END
