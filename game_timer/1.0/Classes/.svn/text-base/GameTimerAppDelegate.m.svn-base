//
//  GameTimerAppDelegate.m
//  GameTimer
//
//  Created by Mark Barber on 4/28/10.
//  Copyright Mark Barber  2010. All rights reserved.
//

#import "GameTimerAppDelegate.h"


#import "RootViewController.h"
#import "DetailViewController.h"
#import "AudioHelper.h"


@implementation GameTimerAppDelegate

@synthesize window, splitViewController, rootViewController, detailViewController;
@synthesize inGameViewController;


#pragma mark -
#pragma mark Application lifecycle

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {    
    
    // Override point for customization after app launch
    
    // Add the split view controller's view to the window and display.
    [window addSubview:splitViewController.view];
    [window makeKeyAndVisible];
	
	lastClick = 0;
	
	NSBundle *mainBundle = [NSBundle mainBundle];	
    clickSound = [[AudioHelper alloc] initWithContentsOfFile:[mainBundle pathForResource:@"click1" ofType:@"caf"]];
//	clickSound = [[AudioHelper alloc] initWithContentsOfFile:[mainBundle pathForResource:@"lvl" ofType:@"caf"]];
	
	switchTurn = [[AudioHelper alloc] initWithContentsOfFile:[mainBundle pathForResource:@"click3" ofType:@"caf"]];
	gameEnd = [[AudioHelper alloc] initWithContentsOfFile:[mainBundle pathForResource:@"timeUp" ofType:@"caf"]];
	

    
    return YES;
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Save data if appropriate
}

- (void) playClick {
	
	if (!lastClick || [NSDate timeIntervalSinceReferenceDate] - lastClick > 0.08)
	{
		// Play Sound
		[clickSound play];
		lastClick = [NSDate timeIntervalSinceReferenceDate];
	}	
}
- (void) playTurnChange {
	[switchTurn play];
}
- (void) playTimeUp {
	[gameEnd play];
}



#pragma mark -
#pragma mark Memory management

- (void)dealloc {
    [splitViewController release];
	[inGameViewController release];
    [window release];
	
	[clickSound release];
	[switchTurn release];
	[gameEnd release];
	 
    [super dealloc];
}

- (void) switchToInGameView:(UIViewController*) controller{	
	
	self.inGameViewController = controller;
	
	CGRect frame = [[UIScreen mainScreen] applicationFrame];
	
	switch(self.inGameViewController.interfaceOrientation){
		case UIInterfaceOrientationPortrait:
		case UIInterfaceOrientationPortraitUpsideDown:
			[self.inGameViewController.view setFrame:frame];
			break;
		case UIInterfaceOrientationLandscapeLeft:
		case UIInterfaceOrientationLandscapeRight:
			[self.inGameViewController.view setFrame:CGRectMake(frame.origin.x, frame.origin.y, frame.size.height, frame.size.width)];
			break;
	}
	
//	CGContextRef context = UIGraphicsGetCurrentContext();
	
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:window cache:NO];
	
	[splitViewController.view removeFromSuperview];
	[window addSubview:self.inGameViewController.view];
	
	[self.inGameViewController viewWillAppear:YES];
	[splitViewController viewWillDisappear:YES];	 	
	
	
	[UIView commitAnimations];
	
	// Turn off System Sleeps
	[UIApplication sharedApplication].idleTimerDisabled = YES;
}

- (void) switchToMainConfigView {
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	[UIView beginAnimations:nil context:context];
	[UIView setAnimationDuration:1.0];
	[UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:window cache:NO];
	
	[self.inGameViewController.view removeFromSuperview];
	[window addSubview:splitViewController.view];
	 
	[splitViewController viewWillAppear:YES];
	[self.inGameViewController viewWillDisappear:YES];	 
	
	[splitViewController didRotateFromInterfaceOrientation:UIDeviceOrientationPortrait];
		
	
	[UIView commitAnimations];
	
	// Turn on System Sleeps
	[UIApplication sharedApplication].idleTimerDisabled = NO;
	
	[self.inGameViewController release];
	inGameViewController = nil;
}

@end

