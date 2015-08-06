//
//  BackAndForthInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Evelyn Manufacturing . All rights reserved.
//

#import "BackAndForthInGame.h"
#import "Helper.h"
#include "GameTimerAppDelegate.h"

@implementation BackAndForthInGame

@synthesize leftButton, rightButton, leftLabel, rightLabel;
@synthesize leftLowerLbl, rightLowerLbl, leftLowerValue, rightLowerValue;


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
	
	[leftPlayer release];
	[rightPlayer release];
	
	[leftButton release];
	[rightButton release];
	
	[leftLabel release];
	[rightLabel release];	
	
	[leftLowerLbl release];
	[rightLowerLbl release];
	[leftLowerValue release];
	[rightLowerValue release];	
}


// State Functions

- (void)viewDidLoad {
    [super viewDidLoad];
	
	leftPlayer = [[Player alloc] init];
	rightPlayer = [[Player alloc] init];
	
	[rightButton setImage:[self loadImage:@"greenButton"] forState:UIControlStateNormal];
	[leftButton setImage:[self loadImage:@"greenButton"] forState:UIControlStateNormal];

	[rightButton setImage:[self loadImage:@"greyButton"] forState:UIControlStateDisabled];
	[leftButton setImage:[self loadImage:@"greyButton"] forState:UIControlStateDisabled];			
	
	[self internalResetClock];
	isMyEvent = FALSE;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	
	if (isMyEvent) {
		if (buttonIndex == 1) {
			[self internalResetClock];
		}
		
		isMyEvent = FALSE;
	}	
	else {
		[super alertView:alertView clickedButtonAtIndex:buttonIndex];
	}
}


- (IBAction)resetClock {
	isMyEvent = TRUE;
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Reset?" message:@"Do you wish to reset your clock back to the original settings?"
												   delegate:self cancelButtonTitle:@"No" otherButtonTitles:@"Yes", nil];
	[alert show];	
	[alert release];		
}

- (void) internalResetClock {
	[leftPlayer resetPlayer:startTotal];
	[rightPlayer resetPlayer:startTotal];	
	
	endGame = FALSE;	
}

- (UIImage *)loadImage:(NSString *)name {
	UIImage *res = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:@"png"]];
	return res;
}

- (IBAction)pauseClock {
	if (endGame)
		return;

	[rightPlayer pauseTurn];
	[leftPlayer pauseTurn];		
}

- (IBAction) leftButtonPush {
	if (endGame)
		return;
	
//	if (![self gameActive]) { // push opposite button, as closer player starts
//		[self leftPlayerStart];
//		return;
//	}
	
	[self rightPlayerStart];		
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playTurnChange];
}

- (IBAction) rightButtonPush {
	if (endGame)
		return;
	
//	if (![self gameActive]) { // push opposite button, as closer player starts
//		[self rightPlayerStart];
//		return;
//	}
	
	[self leftPlayerStart];
	[(GameTimerAppDelegate*)[[UIApplication sharedApplication] delegate] playTurnChange];
}

- (IBAction) leftPlayerCheat {
	if (![self gameActive])
		[leftPlayer incrementTimeWithinPlay];	
}

- (IBAction) rightPlayerCheat {
	if (![self gameActive])
		[rightPlayer incrementTimeWithinPlay];
}


- (void) leftPlayerStart {
	[rightPlayer turnEnd];
	[leftPlayer turnStart];
}


- (void) rightPlayerStart {
	[rightPlayer turnStart];
	[leftPlayer turnEnd];	
}

- (bool)	 gameActive {
	return (!rightPlayer.isPaused || !leftPlayer.isPaused);
}

- (void) updateInterface {
	[self updateClockLabels];
	[self updateButtons];
}

- (void)	updateClockLabels {
	NSTimeInterval lRemain = [leftPlayer getTimeDelta];
	
	if (lRemain > 0) {
		leftLabel.text = [Helper myTimeString:(lRemain)];
	}
	else {
		leftLabel.text = @"Time Up";
		[self endTheGame];
	}	
	
	
	NSTimeInterval rRemain = [rightPlayer getTimeDelta];	
	
	if (rRemain > 0) {
		rightLabel.text = [Helper myTimeString:(rRemain)];
	}
	else {
		rightLabel.text = @"Time Up";
		[self endTheGame];
	}		
	
}
- (void)	updateButtons {
	if ([self gameActive])
	{	
		if (rightPlayer.isPaused) {
			rightButton.enabled = NO;
		}
		else {
			rightButton.enabled = YES;
		}
		
		if (leftPlayer.isPaused) {
			leftButton.enabled = NO;
		}
		else {
			leftButton.enabled = YES;
		}
	}
	else {
		rightButton.enabled = YES;
		leftButton.enabled = YES;
	}	
}


@end