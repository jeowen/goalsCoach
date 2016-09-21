//
//  Event+CoreDataProperties.m
//  goalsCoach
//
//  Created by Jason Owen on 9/19/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import "Event+CoreDataProperties.h"

@implementation Event (CoreDataProperties)

+ (NSFetchRequest<Event *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Event"];
}

@dynamic dateCreated;
@dynamic goalName;
@dynamic highAnchor;
@dynamic lowAnchor;
@dynamic timeStamp;
@dynamic updates;
@dynamic goalValues;

@end
