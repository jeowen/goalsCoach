//
//  DataSource.h
//  goalsCoach
//
//  Created by Jason Owen on 5/2/16.
//  Copyright © 2016 Jason Owen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSource : NSObject

   +(instancetype) sharedInstance;
   @property (nonatomic, strong, readonly) NSArray *goalItems;
@end
