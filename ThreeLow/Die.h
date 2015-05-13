//
//  Die.h
//  ThreeLow
//
//  Created by Jeremy Petter on 2015-05-12.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Die : NSObject

@property (nonatomic) int score;
@property (assign) BOOL locked;


- (int) roll;
+ (instancetype) die;
+ (NSString*)scoreAsString:(int) score;


@end
