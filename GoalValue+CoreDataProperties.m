//
//  GoalValue+CoreDataProperties.m
//  goalsCoach
//
//  Created by Jason Owen on 9/19/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "GoalValue+CoreDataProperties.h"

@implementation GoalValue (CoreDataProperties)

+ (NSFetchRequest<GoalValue *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"GoalValue"];
}

@dynamic date;
@dynamic value;
@dynamic event;

@end
