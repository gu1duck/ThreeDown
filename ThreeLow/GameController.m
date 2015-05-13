//
//  GameController.m
//  ThreeLow
//
//  Created by Jeremy Petter on 2015-05-12.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "GameController.h"

@implementation GameController

+ (instancetype) gameControllerWithDice {
    GameController* controller = [[GameController alloc] init];
    controller.dice = @[[Die die], [Die die], [Die die], [Die die], [Die die]
                        ];
    controller.softLock = [NSMutableArray array];

    return controller;
}

- (void)rollDice{
    [self lockSoftLock];
    for (Die* die in self.dice){
        if(!die.locked){
            [die roll];
        }
    }
}

- (NSArray *)diceAsStrings{
    NSMutableArray* scores = [NSMutableArray array];
    for (id die in self.dice){
        [scores addObject: [Die scoreAsString:[die score]]];
    }
    return scores;
}

- (BOOL)dieIsLocked:(int)index{
    Die* die = self.dice[index];
    return die.locked;
}

- (BOOL) softLocked: (int) dieNumber {
    BOOL locked = NO;
    NSArray* scanner = [NSArray arrayWithArray: self.softLock];
    for(NSNumber* index in scanner){
        if ([index intValue] == dieNumber){
            locked = YES;
            [self.softLock removeObject:index];
        }
    }
    return locked;
}

- (void) lockSoftLock {
    NSArray* scanner = [NSArray arrayWithArray: self.softLock];
    for (NSNumber* index in scanner){
        Die* die = self.dice[[index intValue]];
        die.locked = YES;
        [self.softLock removeObject:index];
    }
}

-(void) resetDice {
    for (Die* die in self.dice){
        die.score = 6;
        die.locked = NO;
    }
    [self.softLock removeAllObjects];
}

-(int) returnScore {
    int total = 0;
    for (Die* die in self.dice){
        if (die.score != 3){
            total += die.score;
        }
    }
    return total;
}


@end
