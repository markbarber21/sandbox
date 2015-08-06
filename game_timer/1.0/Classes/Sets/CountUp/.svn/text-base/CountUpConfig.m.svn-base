    //
//  CountUpConfig.m
//  GameTimer
//
//  Created by Mark Barber on 6/1/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "CountUpConfig.h"
#import "GameTimerAppDelegate.h"
#import "CountUpInGame.h"
#import "Helper.h"


@implementation CountUpConfig

/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if ((self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil])) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
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
}


//
- (IBAction)goInGame {
	GameTimerAppDelegate *myAppDelegate = [[UIApplication sharedApplication] delegate];
	
	CountUpInGame* ctrlr = [[CountUpInGame alloc]
							  initWithNibName: @"CountDownInGame"
							  bundle:nil];	
		
	[myAppDelegate switchToInGameView:ctrlr];
	[ctrlr release];
}

@end