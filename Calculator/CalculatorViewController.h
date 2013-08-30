//
//  CalculatorViewController.h
//  Calculator
//
<<<<<<< HEAD
=======
//  Created by  on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
>>>>>>> c5119b1d551a62fc0ef43a2ab92bcc8426b9cc19
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
<<<<<<< HEAD
@property (weak, nonatomic) IBOutlet UILabel *display;


- (IBAction)operationPressed:(UIButton *)sender;

- (IBAction)enterPressed;

- (IBAction)clearPressed:(id)sender;



=======

@property (weak, nonatomic) IBOutlet UILabel *display;
@property (weak, nonatomic) IBOutlet UILabel *programdisplay;

- (IBAction)digitPressed:(UIButton *)sender;

- (IBAction)enterPressed;

- (IBAction)clearPressed;

- (IBAction)operationPressed:(UIButton *)sender;
>>>>>>> c5119b1d551a62fc0ef43a2ab92bcc8426b9cc19

@end
