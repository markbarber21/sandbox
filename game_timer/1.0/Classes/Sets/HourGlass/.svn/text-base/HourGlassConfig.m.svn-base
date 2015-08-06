    //
//  HourGlassConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/3/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

/*
 Hour Glass—a player loses in this time control when he allows the difference between both clocks 
 to reach the specified total amount. For example, if the total is defined as one minute, both players 
 start their clocks at thirty seconds. Every second the first player uses to think in his moves is subtracted 
 from his clock and added to his opponent's clock. If he uses thirty seconds to move, the difference between the 
 clocks will reach one minute, and the time flag fall to indicate that he loses by time. If he has used twenty 
 nine seconds and then pushes the clock's button, he will have one second left on his clock,
 and his opponent will have fifty-nine seconds. 
 */


#import "HourGlassConfig.h"
#import "GameTimerAppDelegate.h"
#import "HourGlassInGame.h"
#import "Helper.h"


@implementation HourGlassConfig


- (IBAction)goInGame {
	if (!startTotal) {
		[Helper noStartTimeError];
		return;
	}
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	HourGlassInGame* ctrlr = [[HourGlassInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = (long)(startTotal/2); // split up between players
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}


- (void)dealloc {
    [super dealloc];
}

- (NSString*) prefID {
	return @"HourGlassConfig";
}

@end
