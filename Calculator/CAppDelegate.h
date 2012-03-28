//
//  CAppDelegate.h
//  Calculator
//
//  Created by Samuel Williams on 28/03/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

// Step 1: User interface
//	- Add text box.
//	- Add number buttons, operator buttons, equals button and clear button.
// Step 5: User interface
//	- Bind text box value to app delegate value (check "Continuously Updates Value").
//	- Connect buttons to appropriate target-action invocations below.

// Step 2a: Add a set of constants for the various tags we will use for each operator button:
typedef enum {
	CPlus = 1,
	CMinus = 2,
	CMultiply = 3,
	CDivide = 4
} COperator;

@interface CAppDelegate : NSObject <NSApplicationDelegate> {
	// Step 2b: Add variables for calculator state:
	NSDecimalNumber * _value;
	NSString * _display;
	
	COperator _operator;
	
	// Step 6b: Keep a copy of the operator that was pressed:
	NSString * _operatorString;
}

@property (assign) IBOutlet NSWindow *window;

// Step 2c: Add properties for accessing state:
@property(nonatomic,retain) NSString * display;
@property(nonatomic,retain) NSDecimalNumber * value;
@property(nonatomic,assign) COperator operator;

// Step 6a: Extra for expert, display current operator string:
@property(nonatomic,retain,readonly) NSString * operatorString;

// Step 4a: Add target-action invocation selectors:
- (IBAction)pressNumber:(id)sender;
- (IBAction)pressOperator:(id)sender;

- (IBAction)pressEquals:(id)sender;
- (IBAction)pressClear:(id)sender;

@end
