//
//  SimpleDelayInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/15/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "SimpleDelayInGame.h"
#import "Helper.h"

@implementation SimpleDelayInGame

@synthesize additionalTurnTotal;


- (void)viewDidLoad {
    [super viewDidLoad];  // Creates players, First
	
	[rightPlayer addSimpleDelayTime:additionalTurnTotal];
	[leftPlayer addSimpleDelayTime:additionalTurnTotal];
}


- (void) updateInterface {
	[super updateInterface];
	
	
	
	NSTimeInterval leftDelay = [leftPlayer delayTimeLeft];
	if (leftDelay) {
		leftLowerLbl.text = @"Delay remaining:";
		leftLowerValue.text = [Helper myTimeStringMS:leftDelay];
	}
	else {
		leftLowerLbl.text = @"";
		leftLowerValue.text = @"";
	}

	
	NSTimeInterval rightDelay = [rightPlayer delayTimeLeft];
	if (rightDelay) {
		rightLowerLbl.text = @"Delay remaining:";
		rightLowerValue.text = [Helper myTimeStringMS:rightDelay];
	}
	else {
		rightLowerLbl.text = @"";
		rightLowerValue.text = @"";
	}
	
}

@end
