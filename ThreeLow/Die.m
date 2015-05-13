//
//  Die.m
//  ThreeLow
//
//  Created by Jeremy Petter on 2015-05-12.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "Die.h"

@implementation Die

+ (instancetype) die{
    Die* die = [[Die alloc] init];
    die.score = 6;
    return die;
    
}
- (int)roll{
    self.score = arc4random_uniform(5)+1;
    return self.score;
}

+ (NSString*)scoreAsString: (int)score{
    NSArray* strings = @[@"⚀",@"⚁",@"⚂",@"⚃",@"⚄",@"⚅"];
    return strings[score-1];
}

@end