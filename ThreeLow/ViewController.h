//
//  ViewController.h
//  ThreeLow
//
//  Created by Jeremy Petter on 2015-05-12.
//  Copyright (c) 2015 Jeremy Petter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameController.h"

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *dieTwo;
@property (strong, nonatomic) IBOutlet UIButton *dieOne;
@property (strong, nonatomic) IBOutlet UIButton *dieThree;
@property (strong, nonatomic) IBOutlet UIButton *dieFour;
@property (strong, nonatomic) IBOutlet UIButton *dieFive;
@property (strong, nonatomic) IBOutlet UILabel *score;
@property (nonatomic) UIColor* pink;
@property (nonatomic) UIColor* white;
@property (nonatomic) NSArray* diceButtons;


@property (nonatomic) GameController* controller;

@end

