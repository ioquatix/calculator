//
//  CAppDelegate.m
//  Calculator
//
//  Created by Samuel Williams on 28/03/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import "CAppDelegate.h"

@implementation CAppDelegate

@synthesize window = _window;
@synthesize display = _display, value = _value;
@synthesize operatorString = _operatorString;


- (void)dealloc
{
    [super dealloc];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
	// Insert code here to initialize your application
	self.display = @"";
	self.value = [NSDecimalNumber zero];
}

- (void)pressClear:(id)sender
{
	self.display = @"";
	self.value = [NSDecimalNumber zero];
	_operator = 0;
}

- (void)pressEquals:(id)sender
{
	NSDecimalNumber * next = [NSDecimalNumber decimalNumberWithString:self.display];
	
	switch (_operator) {
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

- (void)pressNumber:(id)sender
{
	self.display = [NSString stringWithFormat:@"%@%d", self.display, [sender tag]];
}

- (void)pressOperator:(id)sender
{
	_operator = [sender tag];
	self.value = [NSDecimalNumber decimalNumberWithString:self.display];
	self.display = @"";
	
	self.operatorString = [(NSButton*)sender title];
}

@end
