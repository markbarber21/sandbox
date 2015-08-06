    //
//  CountDownInGame.m
//  GameTimer
//
//  Created by Mark Barber on 4/29/10.
//  Copyright 2010 Programmer. All rights reserved.
//

#import "CountDownInGame.h"
#import "Helper.h"
#import "GameTimerAppDelegate.h"


@implementation CountDownInGame

@synthesize player, timeButton;

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/



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
	[player release];
}

// State Functions

- (void)viewDidLoad {
    [super viewDidLoad];
	
	player = [[Player alloc] init];
	
	[player resetPlayer:startTotal];
	endGame = FALSE;
}

- (IBAction)resetClock {
	[player resetPlayer:startTotal];
	endGame = FALSE;

	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
}

- (IBAction)restartClock {
	[player resetPlayer:startTotal];
	[player turnStart];
	
	endGame = FALSE;
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];	
}

- (void)startClock {
	[player turnStart];
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
}

- (void)stopClock {
	[player turnEnd];
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
}

- (IBAction) timeClick {
	if ([player getTimeDelta] > 0) {
		[self toggleClock];
	}
	else {
		[self restartClock];
	}	
}

- (IBAction)toggleClock {
	[player togglePlayerTurn];
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playClick];
}

- (void) updateInterface {

	NSTimeInterval timeLeft = [player getTimeDelta];
	
	if (timeLeft > 0) {
		[timeButton setTitle:[Helper myTimeString:timeLeft] forState:UIControlStateNormal];
	}
	else {
		[timeButton setTitle:@"Time Up" forState:UIControlStateNormal];
		[self endTheGame];
	}	
}

////



@end
