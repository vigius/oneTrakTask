//
//  ViewController.h
//  Task
//
//  Created by Apple on 16.10.16.
//  Copyright © 2016 8. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TaskViewController : UIViewController
<UITextFieldDelegate>
{
    IBOutlet UILabel * resultLabel;
    IBOutlet UILabel * numOfCalcLabel;
    IBOutlet UITextField * inputField;
}

@property(nonatomic) NSInteger targetNum;
@property(nonatomic) NSInteger numOfCalc;

-(IBAction)startCalc:(id)sender;
-(IBAction)reset:(id)sender;

@end
