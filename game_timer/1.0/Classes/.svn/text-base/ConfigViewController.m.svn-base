    //
//  ConfigViewController.m
//  GameTimer
//
//  Created by Mark Barber on 6/10/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "ConfigViewController.h"


//@interface ConfigViewController ()
//@property (nonatomic, retain) UIPopoverController *popoverController;
//@end

@implementation ConfigViewController


//#pragma mark -
//#pragma mark Split view support

@synthesize toolbar, detailItem;

//- (void)splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
//    
//    barButtonItem.title = @"Game Clocks";
//    NSMutableArray *items = [[toolbar items] mutableCopy];
//    [items insertObject:barButtonItem atIndex:0];
//    [toolbar setItems:items animated:YES];
//    [items release];
//    self.popoverController = pc;
//}
//
//
//// Called when the view is shown again in the split view, invalidating the button and popover controller.
//- (void)splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
//    
//    NSMutableArray *items = [[toolbar items] mutableCopy];
//    [items removeObjectAtIndex:0];
//    [toolbar setItems:items animated:YES];
//    [items release];
//    self.popoverController = nil;
//}
//

#pragma mark -
#pragma mark Managing the popover

- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Add the popover button to the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
	[itemsArray removeAllObjects]; // Hack for walking button across the menu bar
    [itemsArray insertObject:barButtonItem atIndex:0];
    [toolbar setItems:itemsArray animated:NO];
    [itemsArray release];
}


- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem {
    
    // Remove the popover button from the toolbar.
    NSMutableArray *itemsArray = [toolbar.items mutableCopy];
	[itemsArray removeObject:barButtonItem];
    [toolbar setItems:itemsArray animated:NO];
    [itemsArray release];
}


#pragma mark -


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
	
//	self.popoverController = nil;
	self.toolbar = nil;
}


- (void)dealloc {
//    [popoverController release];
    [toolbar release];
    [detailItem release];	
	
    [super dealloc];
}


@end
