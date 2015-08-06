    //
//  BronsteinConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/3/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//



#import "BronsteinConfig.h"
#import "GameTimerAppDelegate.h"
#import "BronsteinInGame.h"
#import "Helper.h"


@implementation BronsteinConfig


- (IBAction)goInGame {
	if (!startTotal) {
		[Helper noStartTimeError];
		return;
	}
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	BronsteinInGame* ctrlr = [[BronsteinInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	ctrlr.additionalTurnTotal = additionalTurnTotal;
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}


- (NSString*) prefID {
	return @"BronsteinConfig";
}


@end
