//
//  GameController.h
//  ThreeLow
//
//  Created by Jeremy Petter on 2015-05-12.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Die.h"

@interface GameController : NSObject
@property NSArray* dice;
@property (nonatomic) NSMutableArray* softLock;

- (void)rollDice;
- (NSArray *)diceAsStrings;
+ (instancetype) gameControllerWithDice;
- (BOOL)dieIsLocked:(int)index;
- (BOOL)softLocked: (int) dieNumber;
- (void) resetDice;
- (int) returnScore;

@end
