//
//  ViewController.m
//  ThreeLow
//
//  Created by Jeremy Petter on 2015-05-12.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()


@end

@implementation ViewController
- (IBAction)resetDice:(id)sender {
    [self.controller resetDice];
    for (UIButton* button in self.diceButtons){
        [button setTitleColor:self.white forState:UIControlStateNormal];
    }
    [self displayScore];
    [self setDiceOutput];
}
- (IBAction)rollDice:(id)sender {
    [self.controller rollDice];
    [self displayScore];
    [self setDiceOutput];
}

- (IBAction)dieOne:(id)sender {
    [self toggleSoftLock:0 forButton:self.dieOne];
}

- (IBAction)dieTwo:(id)sender {
    [self toggleSoftLock:1 forButton:self.dieTwo];
}
- (IBAction)dieThree:(id)sender {
    [self toggleSoftLock:2 forButton:self.dieThree];
}
- (IBAction)dieFour:(id)sender {
    [self toggleSoftLock:3 forButton:self.dieFour];
}
- (IBAction)dieFive:(id)sender {
    [self toggleSoftLock:4 forButton:self.dieFive];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pink = [UIColor colorWithRed:0.988 green:0.337 blue:0.769 alpha:1.0];
    self.white = [UIColor colorWithRed:1 green:1 blue:1 alpha:1.0];
    self.controller = [GameController gameControllerWithDice];
    [self setDiceOutput];
    self.diceButtons = @[self.dieOne, self.dieTwo, self.dieThree,
                         self.dieFour, self.dieFive];
    []
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setDiceOutput{
    NSArray* scoreOutput= [self.controller diceAsStrings];
    
    [self.dieOne setTitle:scoreOutput[0] forState:UIControlStateNormal];
    [self.dieTwo setTitle:scoreOutput[1] forState:UIControlStateNormal];
    [self.dieThree setTitle:scoreOutput[2] forState:UIControlStateNormal];
    [self.dieFour setTitle:scoreOutput[3] forState:UIControlStateNormal];
    [self.dieFive setTitle:scoreOutput[4] forState:UIControlStateNormal];
    
}

- (void)toggleSoftLock: (int) dieIndex forButton: (UIButton*) button{
    if(![self.controller dieIsLocked:dieIndex]){
        if(![self.controller softLocked:dieIndex]){
            [button setTitleColor:self.pink forState:UIControlStateNormal];
            [self.controller.softLock addObject:[NSNumber numberWithInt:dieIndex]];
        } else {
            [button setTitleColor:self.white forState:UIControlStateNormal];
        }
        
    }
}

- (void) displayScore{
    self.score.text = [NSString stringWithFormat: @"%d",[self.controller returnScore]];
}


@end
