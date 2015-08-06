    //
//  SuddenDeathConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/3/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

/*
SUDDEN DEATH
 */


#import "SuddenDeathConfig.h"
#import "GameTimerAppDelegate.h"
#import "SuddenDeathInGame.h"
#import "Helper.h"


@implementation SuddenDeathConfig


- (IBAction)goInGame {
	if (!startTotal) {
		[Helper noStartTimeError];
		return;
	}
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	SuddenDeathInGame* ctrlr = [[SuddenDeathInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}


- (void)dealloc {
    [super dealloc];
}

- (NSString*) prefID {
	return @"SuddenDeathConfig";
}


@end
