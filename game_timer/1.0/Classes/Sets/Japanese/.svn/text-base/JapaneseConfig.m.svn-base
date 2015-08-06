    //
//  JapaneseConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/16/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//



#import "JapaneseConfig.h"
#import "GameTimerAppDelegate.h"
#import "JapaneseInGame.h"
#import "Helper.h"


@implementation JapaneseConfig

@synthesize turnLabel;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	timePeriods = 1; // will need to read from prefs file
	
    [super viewDidLoad];
	[self updateLabels];
}

- (IBAction) addTurnCount{
	timePeriods += 1;
	[self updateTurnCount];
}
- (IBAction) subTurnCount{
	timePeriods -= 1;
	[self updateTurnCount];
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
	
	if (timePeriods > 1){
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
	
	JapaneseInGame* ctrlr = [[JapaneseInGame alloc]
							  initWithNibName: @"BackAndForthInGame"
							  bundle:nil];	
	
	ctrlr.startTotal = startTotal;
	[ctrlr setTimePeriods:timePeriods];
	
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}

- (void) loadPrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	startTotal = [defaults floatForKey:[self prefID]];
	timePeriods = [defaults integerForKey:[[self prefID] stringByAppendingString:@"_att"]];
}

- (void) savePrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setFloat:startTotal forKey:[self prefID]];
	[defaults setInteger:timePeriods forKey:[[self prefID] stringByAppendingString:@"_att"]];
	[defaults synchronize];	
}

- (NSString*) prefID {
	return @"JapaneseConfig";
}




@end
