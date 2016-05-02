//
//  Goals.h
//  goalsCoach
//
//  Created by Jason Owen on 5/2/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Goals : NSObject

    @property (nonatomic, strong) NSString *goalName;
    @property (nonatomic, strong) NSString *goalDescription;
    @property (nonatomic, strong) NSNumber *timestampCreated;
    @property (nonatomic, strong) NSNumber *timestampLastUpdated;
    @property (nonatomic, strong) NSString *lowAnchorDescription;
    @property (nonatomic, strong) NSString *highAnchorDescription;
    @property (nonatomic, strong) NSDictionary *updateValues;


@end
