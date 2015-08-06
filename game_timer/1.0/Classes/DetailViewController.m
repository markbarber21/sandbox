//
//  DetailViewController.m
//  GameTimer
//
//  Created by Mark Barber on 4/28/10.
//  Copyright Mark Barber  2010. All rights reserved.
//

#import "DetailViewController.h"
#import "RootViewController.h"
#import "GameTimerAppDelegate.h"


@implementation DetailViewController

@synthesize detailDescriptionLabel;

#pragma mark -
#pragma mark Managing the detail item


#pragma mark -
#pragma mark Rotation support

// Ensure that the view controller supports rotation and that the split view can therefore show in both portrait and landscape.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidUnload {
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;

}


#pragma mark -
#pragma mark Memory management

/*
- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}
*/

- (void)dealloc {
	
    [detailDescriptionLabel release];
    [super dealloc];
}

@end
