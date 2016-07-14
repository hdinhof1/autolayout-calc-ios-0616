//
//  FISViewController.m
//  Open-Me
//
//  Created by Joe Burgess on 3/4/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISViewController.h"

@interface FISViewController ()

@property (nonatomic) float sum;
@property (strong, nonatomic) NSString *firstNumber;
@property (strong, nonatomic) NSString *secondNumber;
@property (weak, nonatomic) IBOutlet UITextField *numberToDisplay;
@property (weak, nonatomic) IBOutlet UIButton *equalsButton;
@property (nonatomic) BOOL operandIsActive;
@property (nonatomic) BOOL addition;
@property (nonatomic) BOOL subtraction;
@property (nonatomic) BOOL multiplication;
@property (nonatomic) BOOL division;




@end


@implementation FISViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.equalsButton.enabled = NO;
    
}



- (IBAction)oneTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle ];
}
- (IBAction)twoTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)threeTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)fourTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)fiveTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)sixTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)sevenTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)eightTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)nineTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}
- (IBAction)zeroTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}

- (IBAction)decimalPointTapped:(id)sender {
    [self appendDigitToDisplayNumber:((UIButton *)sender).currentTitle];
}

-(void)appendDigitToDisplayNumber:(NSString*)digit {
    if (!self.operandIsActive) {
        if([self.firstNumber length] == 0) { self.firstNumber = digit; } else {
        
        self.firstNumber = [self.firstNumber stringByAppendingString:digit];
        
    

        }
        
    } else {
        if([self.secondNumber length] == 0) { self.secondNumber = digit; } else {
        self.secondNumber =  [self.secondNumber stringByAppendingString:digit];
        }
    }
    [self updateDisplay];
}

-(void)updateDisplay {
    if (!self.operandIsActive) {
        self.numberToDisplay.text = self.firstNumber;
    }else {
        self.numberToDisplay.text = self.secondNumber;
    }
    NSLog(@"Display is: %@", self.numberToDisplay.text);
}



- (IBAction)addTapped:(id)sender {
    self.operandIsActive = !self.operandIsActive;
    self.addition = self.equalsButton.enabled = YES;
    [self updateDisplay];
}
- (IBAction)subtractTapped:(id)sender {
    self.operandIsActive = !self.operandIsActive;
    self.subtraction = self.equalsButton.enabled = YES;
    [self updateDisplay];
}
- (IBAction)multiplyTapped:(id)sender {
    self.operandIsActive = !self.operandIsActive;
    self.multiplication = self.equalsButton.enabled = YES;
    [self updateDisplay];
}
- (IBAction)divideTapped:(id)sender {
    self.operandIsActive = !self.operandIsActive;
    self.division = self.equalsButton.enabled = YES;
    [self updateDisplay];
}
- (IBAction)equalsTapped:(id)sender {
    CGFloat firstNumber = [self.firstNumber floatValue];
    CGFloat secondNumber = [self.secondNumber floatValue];
    CGFloat result = 0;
    
    if (self.addition) {
        result = firstNumber + secondNumber;
    }else if (self.subtraction) {
        result = firstNumber - secondNumber;
    }else if (self.multiplication) {
        result = firstNumber * secondNumber;
    }else if (self.division) {
        result = firstNumber / secondNumber;
    }else {
        NSLog(@"Equals was somehow tapped out of order!");
    }
   
    
    self.firstNumber = [self floatToString:result];
    NSLog(@"Result is %@", self.firstNumber);
    self.secondNumber = @"";
    self.operandIsActive = self.addition = self.subtraction = self.multiplication = self.division = self.equalsButton.enabled = NO;
    [self updateDisplay];
}

- (NSString *) floatToString:(float) val {
    NSString *ret = [NSString stringWithFormat:@"%.5f", val];
    unichar c = [ret characterAtIndex:[ret length] - 1];
    while (c == 48) { // 0
        ret = [ret substringToIndex:[ret length] - 1];
        c = [ret characterAtIndex:[ret length] - 1];
    }
    if ([ret characterAtIndex:[ret length] -1] == 46) { //trailing decimal point
        ret = [ret substringToIndex:[ret length] - 1];
    }
    
    return ret;
}
                        






@end
