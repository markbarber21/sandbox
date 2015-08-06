//
//  SingeStartTurnBonusConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/14/10.
//  Copyright 2010 Programmer. All rights reserved.
//

#import "SingeStartTurnBonusConfig.h"
#import "Helper.h"
#import "GameTimerAppDelegate.h"

@implementation SingeStartTurnBonusConfig

@synthesize turnTime;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	additionalTurnTotal = 0;
    [super viewDidLoad];
	[self updateLabels];
}


- (void)dealloc {
    [super dealloc];
	
	[turnTime release];		
}

- (IBAction) addTurnMin{
	additionalTurnTotal += 60;
	[self updateTurnTime];
}
- (IBAction) subTurnMin{
	additionalTurnTotal -= 60;
	[self updateTurnTime];
}

- (IBAction) addTurnSec{
	additionalTurnTotal += 1;
	[self updateTurnTime];
}

- (IBAction) subTurnSec{
	additionalTurnTotal -= 1;
	[self updateTurnTime];
}

- (void) updateLabels {
	if (additionalTurnTotal < 0)
	{
		additionalTurnTotal = 0;
	}
	
	if (additionalTurnTotal > 60*59 + 59)
	{
		additionalTurnTotal = 60*59 + 59;
	}
	
	turnTime.text = [Helper myTimeStringMS:additionalTurnTotal];
	
	[super updateLabels];
}

- (void) updateTurnTime{
	[self updateLabels];

	if (additionalTurnTotal > 0) {
		[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
	}
	
	[self savePrefs];
}

- (void) loadPrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	startTotal = [defaults floatForKey:[self prefID]];
	additionalTurnTotal = [defaults floatForKey:[[self prefID] stringByAppendingString:@"_att"]];
}

- (void) savePrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setFloat:startTotal forKey:[self prefID]];
	[defaults setFloat:additionalTurnTotal forKey:[[self prefID] stringByAppendingString:@"_att"]];
	[defaults synchronize];	
}


@end
