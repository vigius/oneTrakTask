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

-(void) loadView
{
    CGRect vRect = CGRectMake(0, 0, 414, 739);
    UIView * view = [[UIView alloc] initWithFrame: vRect];
    [view setBackgroundColor:[UIColor whiteColor]];
    
    [view setContentMode:UIViewContentModeScaleToFill];
    [view setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
     UIViewAutoresizingFlexibleHeight];

    
    self.view = view;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    UIColor * llgreyColor = [UIColor colorWithRed:230/250 green:230/250 blue:230/250 alpha:0.13];
    UIFont *labelFont = [UIFont systemFontOfSize: 25];
    UIFont *buttonFont = [UIFont systemFontOfSize: 20];
    
    // creating resultLable
    CGRect rlRect = CGRectMake(23, 90, 172, 45);
    resultLabel = [[UILabel alloc] initWithFrame: rlRect];
    [resultLabel setBackgroundColor:llgreyColor];
    [resultLabel setTextAlignment:NSTextAlignmentCenter];
    [resultLabel setFont: labelFont];
    [resultLabel setText:@"Результат"];
    [resultLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                     UIViewAutoresizingFlexibleBottomMargin |
                                     UIViewAutoresizingFlexibleRightMargin |
                                     UIViewAutoresizingFlexibleLeftMargin];
    [self.view addSubview:resultLabel];
    
    // creating numOfCalcLable
    CGRect noclRect = CGRectMake(221, 90, 172, 45);
    numOfCalcLabel = [[UILabel alloc] initWithFrame: noclRect];
    [numOfCalcLabel setBackgroundColor:llgreyColor];
    [numOfCalcLabel setTextAlignment:NSTextAlignmentRight];
    [numOfCalcLabel setFont: labelFont];
    [numOfCalcLabel setText:@"#"];
    [numOfCalcLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                        UIViewAutoresizingFlexibleBottomMargin |
                                        UIViewAutoresizingFlexibleLeftMargin |
                                        UIViewAutoresizingFlexibleRightMargin];
    [self.view addSubview:numOfCalcLabel];
    
    // creating botton startCalculate
    CGRect sbRect = CGRectMake(221, 164, 172, 30);
    UIButton * startCalc = [[UIButton alloc] initWithFrame: sbRect];
    [startCalc setBackgroundColor:llgreyColor];
    [startCalc setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [startCalc setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
    startCalc.titleLabel.font = buttonFont;
    [startCalc setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    
    [startCalc setTitle:@"Посчитать" forState:UIControlStateNormal];
    [startCalc addTarget:self
                  action:@selector(startCalc:)
        forControlEvents:UIControlEventTouchUpInside];
    
    [startCalc setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                   UIViewAutoresizingFlexibleBottomMargin |
                                   UIViewAutoresizingFlexibleRightMargin |
                                   UIViewAutoresizingFlexibleLeftMargin];
    [self.view addSubview:startCalc];
    
    // creating botton reset
    CGRect rbRect = CGRectMake(23, 216, 371, 30);
    UIButton * resetCalc = [[UIButton alloc] initWithFrame: rbRect];
    [resetCalc setBackgroundColor:llgreyColor];
    [resetCalc setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [resetCalc setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    
    resetCalc.titleLabel.font = buttonFont;
    [resetCalc setTitleColor:[UIColor blueColor] forState: UIControlStateNormal];
    
    [resetCalc setTitle:@"Заново" forState:UIControlStateNormal];
    [resetCalc addTarget:self
                  action:@selector(reset:)
        forControlEvents:UIControlEventTouchUpInside];
    [resetCalc setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                   UIViewAutoresizingFlexibleBottomMargin |
                                   UIViewAutoresizingFlexibleRightMargin |
                                   UIViewAutoresizingFlexibleLeftMargin];
    [self.view addSubview:resetCalc];
    
    // creating text field
    CGRect tfRect = CGRectMake(23, 164, 172, 30);
    inputField = [[UITextField alloc] initWithFrame: tfRect];
    
    [inputField setBorderStyle:UITextBorderStyleRoundedRect];
    inputField.layer.borderColor = [[UIColor darkGrayColor]CGColor];
    inputField.layer.borderWidth = 1.0f;
    inputField.layer.cornerRadius = 5.0f;
    
    [inputField setKeyboardType:UIKeyboardTypeNumberPad];
    
    [inputField setDelegate:self];
    
    [inputField setTextAlignment:NSTextAlignmentCenter];
    [inputField setTextColor:llgreyColor];
    [inputField setText:@"Введите число"];
    [inputField setAutoresizingMask:UIViewAutoresizingFlexibleWidth |
                                    UIViewAutoresizingFlexibleBottomMargin |
                                    UIViewAutoresizingFlexibleRightMargin |
                                    UIViewAutoresizingFlexibleLeftMargin];
    
    [self.view addSubview:inputField];

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
    [numOfCalcLabel setText:[NSString stringWithFormat:@"%ld", numOfCalc]];
}

-(IBAction)reset:(id)sender
{
    UIColor * llgreyColor = [UIColor colorWithRed:230/250 green:230/250 blue:230/250 alpha:0.13];
    [inputField setTextColor:llgreyColor];
    [inputField setText:@"Введите число"];
    [inputField endEditing:YES];
    [resultLabel setText:@"Результат"];
    [numOfCalcLabel setText:@"#"];
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

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [textField setText:@""];
    [textField setTextColor:[UIColor blackColor]];
}

@end
