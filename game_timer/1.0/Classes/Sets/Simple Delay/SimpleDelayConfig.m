    //
//  SimpleDelayConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/15/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//



#import "SimpleDelayConfig.h"
#import "GameTimerAppDelegate.h"
#import "SimpleDelayInGame.h"
#import "Helper.h"


@implementation SimpleDelayConfig


- (IBAction)goInGame {
	if (!startTotal) {
		[Helper noStartTimeError];
		return;
	}
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	SimpleDelayInGame* ctrlr = [[SimpleDelayInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	ctrlr.additionalTurnTotal = additionalTurnTotal;
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}


- (NSString*) prefID {
	return @"SimpleDelayConfig";
}

@end
