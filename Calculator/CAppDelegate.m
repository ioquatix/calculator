//
//  CAppDelegate.m
//  Calculator
//
//  Created by Samuel Williams on 28/03/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import "CAppDelegate.h"

@interface CAppDelegate ()
@property(nonatomic,retain) NSString * operatorString;
@end

@implementation CAppDelegate

// Step 2d: Add synthesize for properties:
@synthesize window = _window, value = _value, display = _display, operator = _operator, operatorString = _operatorString;

- (void)dealloc
{
	self.value = nil;
	self.display = nil;
	self.operatorString = nil;
	
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Step 3: Set reasonable defaults:
	[self pressClear:self];
}

// Step 4b: Implement number button handling:
- (IBAction)pressNumber:(id)sender
{
	self.display = [NSString stringWithFormat:@"%@%d", self.display, [sender tag]];
}

// Step 4d: Implement operators button press:
- (IBAction)pressOperator:(id)sender
{
	// Save the operator that has been pressed:
	self.operator = [sender tag];
	self.operatorString = [(NSButton*)sender title];
	
	if (![self.display isEqualToString:@""]) {		
		// Copy the number being displayed into the value buffer:
		self.value = [NSDecimalNumber decimalNumberWithString:self.display];
		
		self.display = @"";
	}
}

// Step 4e: Implement equals button press:
- (void)pressEquals:(id)sender
{
	NSDecimalNumber * next = [NSDecimalNumber decimalNumberWithString:self.display];
	
	switch (self.operator) {
		case CPlus:
			self.value = [self.value decimalNumberByAdding:next];
			self.display = [self.value stringValue];
			break;
		
		case CMinus:
			self.value = [self.value decimalNumberBySubtracting:next];
			self.display = [self.value stringValue];
			break;
			
		case CMultiply:
			self.value = [self.value decimalNumberByMultiplyingBy:next];
			self.display = [self.value stringValue];
			break;
		
		case CDivide:
			self.value = [self.value decimalNumberByDividingBy:next];
			self.display = [self.value stringValue];
			break;
			
		default:
			break;
	}
}

// Step 4f: Implement clear button press:
- (void)pressClear:(id)sender 
{
	self.value = nil;
	self.display = @"";
	self.operator = 0;
	self.operatorString = @"";
}

@end
