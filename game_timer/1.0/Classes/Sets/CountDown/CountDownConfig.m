    //
//  CountDownConfig.m
//  GameTimer
//
//  Created by Mark Barber on 4/29/10.
//  Copyright 2010 Programmer. All rights reserved.
//

#import "CountDownConfig.h"
#import "GameTimerAppDelegate.h"
#import "CountDownInGame.h"
#import "Helper.h"

@implementation CountDownConfig


- (IBAction)goInGame {
	if (!startTotal) {
		[Helper noStartTimeError];
		return;
	}
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	CountDownInGame* ctrlr = [[CountDownInGame alloc]
							  initWithNibName: @"CountDownInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}

- (NSString*) prefID {
	return @"CountDownConfig";
}


- (void)dealloc {	
    [super dealloc];
}



@end
