//
//  CAppDelegate.h
//  Calculator
//
//  Created by Samuel Williams on 28/03/12.
//  Copyright (c) 2012 Orion Transfer Ltd. All rights reserved.
//

#import <Cocoa/Cocoa.h>

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
	
	NSString * _operatorString;
}

@property (assign) IBOutlet NSWindow *window;

@property(nonatomic,retain) NSDecimalNumber * value;
@property(nonatomic,retain) NSString * display;

@property(nonatomic,retain) NSString * operatorString;

- (IBAction)pressNumber:(id)sender;
- (IBAction)pressOperator:(id)sender;

- (IBAction)pressEquals:(id)sender;
- (IBAction)pressClear:(id)sender;

@end

@interface NSObject (Foobar)

- foobar;

@end