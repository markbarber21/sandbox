    //
//  CountUpInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/1/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "CountUpInGame.h"
#import "GameTimerAppDelegate.h"
#import "Helper.h"

@implementation CountUpInGame

@synthesize timeButton;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[self internalResetClock];
	[self startEventLoop];	
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
    [super dealloc];
	
	[timeButton release];
	[lastClick release];
}


-(void) startEventLoop {	
	updateTimer = [NSTimer
				   scheduledTimerWithTimeInterval:0.2 
				   target:self 
				   selector:@selector (clockEventLoop) 
				   userInfo:nil 
				   repeats:YES]; 
} 

-(void) clockEventLoop {
	if (paused)
		return;	
	
	[timeButton setTitle:[Helper myTimeString:[self getTimeGoneBy]] forState:UIControlStateNormal];
}

- (NSTimeInterval) getTimeGoneBy {
	NSDate* now = [NSDate date];
	[now retain];
	
	NSTimeInterval timeGoneBy = [now timeIntervalSinceDate:lastClick];
	NSTimeInterval timePassed = currentTotal + timeGoneBy;
	
	[now release];	
	
	return timePassed;
}

- (IBAction) timeClick {
	[self toggleClock];	
}

- (IBAction) toggleClock{
	if (paused){
		[self start];
	}
	else {
		[self pause];
	}	
}

- (void) start{
	[lastClick release];
	lastClick = [NSDate date];
	[lastClick retain];
	
	paused = FALSE;
	
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
}

- (void) pause{
	paused = TRUE;
	
	NSDate* now = [NSDate date];
	[now retain];	
	NSTimeInterval timeGoneBy = [now timeIntervalSinceDate:lastClick];
	[now release];	
	
	currentTotal += timeGoneBy;	
	
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
}

- (IBAction) resetClock{
	[self internalResetClock];
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
}

-(void) internalResetClock {
	paused = TRUE;
	currentTotal = 0;
	[timeButton setTitle:[Helper myTimeString:currentTotal]  forState:UIControlStateNormal];
	
}

- (IBAction) restartClock {
	[self internalResetClock];
	[self start];	
}

- (IBAction)editConfig {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Exit?" message:@"Exit Game and go back to the configuration screen?"
												   delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
	[alert show];	
	[alert release];	
	
	
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (buttonIndex == 1) {
		[self goBackToConfig];
	}	
}

- (void) goBackToConfig {
	[updateTimer invalidate];
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	[myAppDelegate switchToMainConfigView];
}



@end
