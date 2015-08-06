//
//  RootViewController.h
//  GameTimer
//
//  Created by Mark Barber on 4/28/10.
//  Copyright Mark Barber  2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameType.h"

@class ConfigViewController;
@class DetailViewController;
//@class GameType;


/*
 SubstitutableDetailViewController defines the protocol that detail view controllers must adopt. The protocol specifies methods to hide and show the bar button item controlling the popover.
 
 */
@protocol SubstitutableDetailViewController
- (void)showRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
- (void)invalidateRootPopoverButtonItem:(UIBarButtonItem *)barButtonItem;
@end


@interface RootViewController : UITableViewController <UISplitViewControllerDelegate>  {
	
	UISplitViewController *splitViewController;
    
    UIPopoverController *popoverController;    
    UIBarButtonItem *rootPopoverButtonItem;
	
	
	
	
    DetailViewController *detailViewController;
	
	NSMutableArray * appInformationTypes;
	NSMutableArray * counterGameTypes;
	NSMutableArray * chessGameTypes;
	NSMutableArray * goGameTypes;
}

-(ConfigViewController*) newViewForType:(GameType*)type;


@property (nonatomic, assign) IBOutlet UISplitViewController *splitViewController;
@property (nonatomic, retain) UIPopoverController *popoverController;
@property (nonatomic, retain) UIBarButtonItem *rootPopoverButtonItem;


@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;



@end
