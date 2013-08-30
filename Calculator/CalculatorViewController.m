//
//  CalculatorViewController.m
//  Calculator
//
<<<<<<< HEAD
=======
//  Created by  on 6/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
>>>>>>> c5119b1d551a62fc0ef43a2ab92bcc8426b9cc19
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

<<<<<<< HEAD
@interface CalculatorViewController()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;

@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;


@synthesize brain = _brain;

- (CalculatorBrain *) brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
    
}

- (IBAction)digitPressed:(UIButton *)sender 
{
    NSString *digit = sender.currentTitle;
    
    
    NSLog(@"digit pressed = %@", digit);
    
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
    
    self.display.text = [self.display.text stringByAppendingString:digit];
    }
    else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
}

- (IBAction)operationPressed:(UIButton *)sender 
{

    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
}
- (IBAction)enterPressed 
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    
    self.userIsInTheMiddleOfEnteringANumber = NO;
}

- (IBAction)clearPressed:(id)sender 

{
    self.display.text = @"";
    [self.brain clear];
}

=======
//--------------------------------------------------------------------------------------------
@interface CalculatorViewController()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;

@property (nonatomic, strong) CalculatorBrain *brain;

@end

//--------------------------------------------------------------------------------------------
@implementation CalculatorViewController



@synthesize display = _display;
@synthesize programdisplay = _programdisplay;

@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;

@synthesize brain = _brain;
//--------------------------------------------------------------------------------------------
- (CalculatorBrain *) brain
{
	if (!_brain) _brain = [[CalculatorBrain alloc] init ];
	return _brain;
}


//--------------------------------------------------------------------------------------------
- (IBAction)digitPressed:(UIButton *)sender 

{
	NSString *digit = [sender currentTitle];
	
	
	if (self.userIsInTheMiddleOfEnteringANumber)
	{
		if (self.display.text != @"0")
		{
			self.display.text  = [ [self.display text] stringByAppendingString:digit];
		}
		else
		{
			self.display.text = digit;
		}
	}
	else
	{
		self.display.text = digit;
		
		self.userIsInTheMiddleOfEnteringANumber = YES;
	}
	NSLog(@"digit pressed = %@", digit);
}
//--------------------------------------------------------------------------------------------
- (IBAction)enterPressed 
{
	[self.brain pushOperand:[self.display.text doubleValue]];
	self.userIsInTheMiddleOfEnteringANumber = NO;
}

//--------------------------------------------------------------------------------------------
- (IBAction)clearPressed 
{
	self.display.text = @"0";
	self.programdisplay.text = @"";

}
//--------------------------------------------------------------------------------------------
- (IBAction)operationPressed:(UIButton *)sender 
{
	if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
	double result = [self.brain performOperation:sender.currentTitle];
	NSString *resultString = [NSString stringWithFormat:@"%g", result];
	self.programdisplay.text = [CalculatorBrain descriptionOfProgram:[self.brain program]];
	self.display.text = resultString;
}
//--------------------------------------------------------------------------------------------
- (void)viewDidUnload {
	[self setProgramdisplay:nil];
	[super viewDidUnload];
}
>>>>>>> c5119b1d551a62fc0ef43a2ab92bcc8426b9cc19
@end
