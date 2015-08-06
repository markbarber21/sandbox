    //
//  CanadianConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/16/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//



#import "CanadianConfig.h"
#import "GameTimerAppDelegate.h"
#import "CanadianInGame.h"
#import "Helper.h"


@implementation CanadianConfig

@synthesize turnLabel;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	stonesPerTimePeriod = 1; // will need to read from prefs file
	
    [super viewDidLoad];
	[self updateLabels];
}

- (IBAction) addTurnCount{
	stonesPerTimePeriod += 1;
	[self updateTurnCount];
}
- (IBAction) subTurnCount{
	stonesPerTimePeriod -= 1;
	[self updateTurnCount];
}

- (void) updateLabels {
	if (stonesPerTimePeriod < 1)
	{
		stonesPerTimePeriod = 1;
	}
	
	if (stonesPerTimePeriod > 99)
	{
		stonesPerTimePeriod = 99;
	}
	
	turnLabel.text = [NSString stringWithFormat:@"%02d", stonesPerTimePeriod];
	
	[super updateLabels];
}

- (void) updateTurnCount {

	[self updateLabels];
	
	if (stonesPerTimePeriod > 1) {
		[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
	}
	
	[self savePrefs];
}



- (IBAction)goInGame {
	if (!startTotal) {
		[Helper noStartTimeError];
		return;
	}
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	CanadianInGame* ctrlr = [[CanadianInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	[ctrlr setStonesPerTimePeriod:stonesPerTimePeriod];
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}

- (void) loadPrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	startTotal = [defaults floatForKey:[self prefID]];
	stonesPerTimePeriod = [defaults integerForKey:[[self prefID] stringByAppendingString:@"_att"]];
}

- (void) savePrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setFloat:startTotal forKey:[self prefID]];
	[defaults setInteger:stonesPerTimePeriod forKey:[[self prefID] stringByAppendingString:@"_att"]];
	[defaults synchronize];	
}

- (NSString*) prefID {
	return @"CanadianConfig";
}


@end
