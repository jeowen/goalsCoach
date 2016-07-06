//
//  Goals.h
//  goalsCoach
//
//  Created by Jason Owen on 7/5/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goals : NSObject
@property (nonatomic, strong) NSString *goalName;

// NSDate *now = [NSDate date];
@property (nonatomic, strong) NSDate *dateCreated;

@property (nonatomic, strong) NSDictionary *updates;
// updates {
//   timestamp1: value;
//   timestamp2: value;
//   timestamp3: value
//  }
@property (nonatomic, strong) NSString *lowAnchor;
@property (nonatomic, strong) NSString *highAnchor;
@end
