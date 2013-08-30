//
//  CalculatorBrain.m
//  Calculator
//
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *programStack;


@end


@implementation CalculatorBrain


@synthesize programStack = _programStack;

- (NSMutableArray *) programStack
{
    if (_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

- (void) setProgramStack:(NSMutableArray *)programStack
{
    _programStack = programStack;
}

- (void) clear
{
    
    [self.programStack removeAllObjects];
}


- (void) pushOperand : (double) operand
{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    [self.programStack addObject:operandObject];
    
}

- (double) performOperation : (NSString *) operation;
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}

- (id) program
{
    return [self.programStack copy];
}

- (NSString *) descriptionOfProgram : (id) program
{
    return [NSString stringWithFormat:@"Description: %@", self.programStack];
}

+ (double) popOperandOffStack : (NSMutableArray *) stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    
    if (topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]]) 
    {
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]])
    {
        NSString *operation = topOfStack;
        if ([operation isEqualToString:@"+"])
        {
            result = [self popOperandOffStack:stack] + [self popOperandOffStack:stack];
        } else if ([@"*" isEqualToString:operation])
        {
            result = [self popOperandOffStack:stack] * [self popOperandOffStack:stack];
        }
        else if ([@"-" isEqualToString:operation])
        {
            double subtrahend = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] - subtrahend;
        }
        else if ([@"/" isEqualToString:operation])
        {
            double divisor = [self popOperandOffStack:stack];
            result = [self popOperandOffStack:stack] / divisor;
        }
    }
    
    return result;
}


+ (double) runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]])
    {
        stack = [program mutableCopy];
    }
    return [self popOperandOffStack:stack];
}


+ (NSString *) descriptionOfProgram:(id)program
{
    return [NSString stringWithFormat:@"Description : "];
            
}

@end
