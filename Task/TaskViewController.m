//
//  ViewController.m
//  Task
//
//  Created by Apple on 16.10.16.
//  Copyright © 2016 8. All rights reserved.
//

#import "TaskViewController.h"

@implementation TaskViewController

@synthesize targetNum, numOfCalc;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [inputField setClearsOnInsertion:YES];
    [inputField setClearsOnBeginEditing:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)startCalc:(id)sender
{
    // get data
    [self setTargetNum:[[inputField text] intValue]];
    [self setNumOfCalc:targetNum];
    
    //calc data
    NSInteger output = targetNum;
    for (int i = 0; i < numOfCalc; i++) {
        output += targetNum;
    }

    // output data
    [resultLabel setText: [NSString stringWithFormat:@"%ld", output]];
    [numOfCalcabel setText:[NSString stringWithFormat:@"%ld", numOfCalc]];
}

-(IBAction)reset:(id)sender
{
    [inputField setText:@"Введи число"];
    [inputField endEditing:YES];
    [resultLabel setText:@"Результат"];
    [numOfCalcabel setText:@"#"];
}

-(void)setNumOfCalc:(NSInteger)i
{
    // if i == 0
    if (!i) {
        numOfCalc = 0;
    }
    
    else{
        numOfCalc = i - 1;
    }
}

@end
