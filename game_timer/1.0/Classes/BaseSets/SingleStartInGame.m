//
//  SingleStartInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "SingleStartInGame.h"
#import "GameTimerAppDelegate.h"
#import "Helper.h"

@implementation SingleStartInGame

@synthesize startTotal;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[self startEventLoop];	
	
	endGame = FALSE;
}

- (void)dealloc {
	[super dealloc];
}

-(void) startEventLoop {	
	clockViewUpdateTimer = [NSTimer
							scheduledTimerWithTimeInterval:0.2 
							target:self 
							selector:@selector (clockEventLoop) 
							userInfo:nil 
							repeats:YES]; 
} 

-(void) clockEventLoop {
	if (endGame)
		return;

	[self updateInterface];
}

- (void) updateInterface {
	// Base version does nothing
}

- (void) endTheGame {
	endGame = TRUE;
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playTimeUp];
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
	[clockViewUpdateTimer invalidate];
	
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	[myAppDelegate switchToMainConfigView];	
}


@end
