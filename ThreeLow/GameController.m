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
    for (id die in self.dice){
        [die roll];
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
    for(NSNumber* index in self.softLock){
        if ([index intValue] == dieNumber){
            locked = YES;
            [self.softLock removeObject:index];
        }
    }
    return locked;
}

- (void) lockSoftLock {
    for (NSNumber* index in self.softLock){
        Die* die = self.dice[[index intValue]];
        die.locked = YES;
        [self.softLock removeObject:index];
    }
}


@end
