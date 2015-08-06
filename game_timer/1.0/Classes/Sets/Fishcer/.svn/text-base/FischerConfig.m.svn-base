    //
//  FischerConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/3/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//



#import "FischerConfig.h"
#import "GameTimerAppDelegate.h"
#import "FischerInGame.h"
#import "Helper.h"


@implementation FischerConfig


- (IBAction)goInGame {
	if (!startTotal) {
		[Helper noStartTimeError];
		return;
	}
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	FischerInGame* ctrlr = [[FischerInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	ctrlr.additionalTurnTotal = additionalTurnTotal;
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}

- (NSString*) prefID {
	return @"FischerConfig";
}


@end
