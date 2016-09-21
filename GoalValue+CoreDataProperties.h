//
//  GoalValue+CoreDataProperties.h
//  goalsCoach
//
//  Created by Jason Owen on 9/19/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "GoalValue+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface GoalValue (CoreDataProperties)

+ (NSFetchRequest<GoalValue *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDate *date;
@property (nullable, nonatomic, copy) NSNumber *value;
@property (nullable, nonatomic, retain) Event *event;

@end

NS_ASSUME_NONNULL_END
