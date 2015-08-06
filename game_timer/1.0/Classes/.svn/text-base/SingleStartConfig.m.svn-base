//
//  SingleStartConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "SingleStartConfig.h"
#import "Helper.h"
#import "GameTimerAppDelegate.h"

@implementation SingleStartConfig

@synthesize singleTime;



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	startTotal = 0; // will need to read from prefs file
	[self loadPrefs];
	[self updateLabels];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Overriden to allow any orientation.
    return YES;
}

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;


}


- (void)dealloc {	
	[singleTime release];	
	
    [super dealloc];
}

- (IBAction) addHour{
	startTotal += 60*60;
	[self updateTime];
}
- (IBAction) subHour{
	startTotal -= 60*60;
	[self updateTime];
}

- (IBAction) addMin{
	startTotal += 60;
	[self updateTime];
}
- (IBAction) subMin{
	startTotal -= 60;
	[self updateTime];
}

- (IBAction) addSec{
	startTotal += 1;
	[self updateTime];
}

- (IBAction) subSec{
	startTotal -= 1;
	[self updateTime];
}

- (void) updateLabels {  
	if (startTotal < 0)
	{
		startTotal = 0;
	}
	
	singleTime.text = [Helper myTimeString:startTotal];
}

- (void) updateTime{
	[self updateLabels];
	
	if (startTotal > 0)
	{
		[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
	}

	[self savePrefs];
}

- (void) loadPrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	startTotal = [defaults floatForKey:[self prefID]];
}

- (void) savePrefs {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setFloat:startTotal forKey:[self prefID]];
	[defaults synchronize];	
}

- (NSString*) prefID {
	return @"myKey";
}


@end
