    //
//  JapaneseOvertimeConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/17/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//



#import "JapaneseOvertimeConfig.h"
#import "GameTimerAppDelegate.h"
#import "JapaneseOvertimeInGame.h"
#import "Helper.h"


@implementation JapaneseOvertimeConfig

@synthesize turnLabel, perPeriodLabel;


- (void)dealloc {
    [super dealloc];
	
	[turnLabel release];
	[perPeriodLabel release];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	timePeriods = 1; // will need to read from prefs file
	perPeriodTotal = 0;
	
    [super viewDidLoad];
		
	[self updateLabels];
	[self updatePeriodLabels];
}

- (IBAction) addTurnCount{
	timePeriods += 1;
	[self updateTurnCount];
}
- (IBAction) subTurnCount{
	timePeriods -= 1;
	[self updateTurnCount];
}
	
- (IBAction) addMinPerPer{
	perPeriodTotal += 60;
	[self updatePeriodTotal];
}
- (IBAction) subMinPerPer{
	perPeriodTotal -= 60;
	[self updatePeriodTotal];
}

- (IBAction) addSecPerPer{
	perPeriodTotal += 1;
	[self updatePeriodTotal];
}
- (IBAction) subSecPerPer{
	perPeriodTotal -= 1;
	[self updatePeriodTotal];
}

- (void) updateLabels {
	if (timePeriods < 1)
	{
		timePeriods = 1;
	}
	
	if (timePeriods > 999)
	{
		timePeriods = 999;
	}
	turnLabel.text = [NSString stringWithFormat:@"%03d", timePeriods];	
	
	[super updateLabels];
}

- (void) updateTurnCount {
	
	[self updateLabels];
		
	if (timePeriods > 1) {
		[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
	}
	
	[self savePrefs];
}

- (void) updatePeriodLabels {
	if (perPeriodTotal < 1)
	{
		perPeriodTotal = 1;
	}
	
	if (perPeriodTotal > 60*60 - 1)
	{
		perPeriodTotal = 60*60 - 1;
	}
	perPeriodLabel.text = [Helper myTimeStringMS:perPeriodTotal];		
}

- (void) updatePeriodTotal {
	[self updatePeriodLabels];
	
	if (perPeriodTotal > 1) {
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
	
	JapaneseOvertimeInGame* ctrlr = [[JapaneseOvertimeInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	[ctrlr setTimePeriods:timePeriods];
	[ctrlr setPerPeriodTotal:perPeriodTotal];
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}


- (void) loadPrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	startTotal = [defaults floatForKey:[self prefID]];
	timePeriods = [defaults integerForKey:[[self prefID] stringByAppendingString:@"_att"]];
	perPeriodTotal = [defaults floatForKey:[[self prefID] stringByAppendingString:@"_ppt"]];
}

- (void) savePrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setFloat:startTotal forKey:[self prefID]];
	[defaults setInteger:timePeriods forKey:[[self prefID] stringByAppendingString:@"_att"]];
	[defaults setFloat:perPeriodTotal forKey:[[self prefID] stringByAppendingString:@"_ppt"]];	
	[defaults synchronize];	
}

- (NSString*) prefID {
	return @"JapaneseOvertimeConfig";
}



@end
