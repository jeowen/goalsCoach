//
//  Event+CoreDataProperties.h
//  goalsCoach
//
//  Created by Jason Owen on 8/29/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Event.h"

NS_ASSUME_NONNULL_BEGIN

@interface Event (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *dateCreated;
@property (nullable, nonatomic, retain) NSString *goalName;
@property (nullable, nonatomic, retain) NSString *highAnchor;
@property (nullable, nonatomic, retain) NSString *lowAnchor;
@property (nullable, nonatomic, retain) NSDate *timeStamp;
@property (nullable, nonatomic, retain) NSString *updates;

@end

NS_ASSUME_NONNULL_END
