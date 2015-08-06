
//  RootViewController.m
//  GameTimer
//
//  Created by Mark Barber on 4/28/10.
//  Copyright Mark Barber  2010. All rights reserved.
//

#import "RootViewController.h"
#import "DetailViewController.h"
#import "GameTimerAppDelegate.h"
#import "GameType.h"

// Import different timer configurations
#import "CountDownConfig.h"
#import "CountUpConfig.h"
#import "HourGlassConfig.h"
#import "SuddenDeathConfig.h"
#import "FischerConfig.h"
#import "BronsteinConfig.h"
#import "SimpleDelayConfig.h"
#import "CanadianConfig.h"
#import "JapaneseConfig.h"
#import "JapaneseOvertimeConfig.h"
#import "HelpViewController.h"
#import "WebHelp.h"

enum GameTypeIDs {
	CountDownID		= 1
	, CountUpID
	, HourGlassID
	, SuddenDeathID
	, FischerID
	, BronsteinID
	, SimpleDelayID
	, CanadianID
	, JapaneseID
	, JapaneseOvertimeID

	
	, AboutID
	, HelpID
};


@implementation RootViewController

@synthesize detailViewController;
@synthesize popoverController, splitViewController, rootPopoverButtonItem;


#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
    self.clearsSelectionOnViewWillAppear = NO;
    self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
	
	// Setup Game Type Array
	
	appInformationTypes = [[NSMutableArray alloc] init];
	counterGameTypes = [[NSMutableArray alloc] init];	
	chessGameTypes = [[NSMutableArray alloc] init];	
	goGameTypes = [[NSMutableArray alloc] init];

// App Information
	
	GameType *gameType = [[GameType alloc] init];
	gameType.title = @"About";
	gameType.nibName = @"DetailView";
	gameType.details =	@"";
	gameType.ctrlrID  = [NSNumber numberWithInt: AboutID];
	[appInformationTypes addObject: gameType];
	[gameType release];		
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Help";
	gameType.nibName = @"WebHelp";
	gameType.details =	@"";
	gameType.ctrlrID  = [NSNumber numberWithInt: HelpID];
	[appInformationTypes addObject: gameType];
	[gameType release];			
	
	
// Counters	
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Count Down";
	gameType.nibName = @"SingleStartConfig";
	gameType.details =	@"Simple Count Down Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: CountDownID];
	[counterGameTypes addObject: gameType];
	[gameType release];	
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Count Up";
	gameType.nibName = @"CountUpConfig";
	gameType.details =	@"Stopwatch type Count Up Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: CountUpID];
	[counterGameTypes addObject: gameType];
	[gameType release];	
	
// Chess	
	gameType = [[GameType alloc] init];
	gameType.title = @"Sudden Death";
	gameType.nibName = @"SingleStartConfig";
	gameType.details =	@"Sudden Death Chess Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: SuddenDeathID];
	[chessGameTypes addObject: gameType];
	[gameType release];		
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Hour Glass";
	gameType.nibName = @"SingleStartConfig";
	gameType.details =	@"Hour Glass Chess Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: HourGlassID];
	[chessGameTypes addObject: gameType];
	[gameType release];		
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Fischer";
	gameType.nibName = @"FischerConfig";
	gameType.details =	@"Fischer Chess Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: FischerID];
	[chessGameTypes addObject: gameType];
	[gameType release];		
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Bronstein";
	gameType.nibName = @"BronsteinConfig";
	gameType.details =	@"Bronstein Chess Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: BronsteinID];
	[chessGameTypes addObject: gameType];
	[gameType release];	
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Simple Delay";
	gameType.nibName = @"SimpleDelayConfig";
	gameType.details =	@"SimpleDelay Chess Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: SimpleDelayID];
	[chessGameTypes addObject: gameType];
	[gameType release];		
	
// Go	
	gameType = [[GameType alloc] init];
	gameType.title = @"Canadian";
	gameType.nibName = @"CanadianConfig";
	gameType.details =	@"Canadian Go/Weiqi/圍棋 Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: CanadianID];
	[goGameTypes addObject: gameType];
	[gameType release];	
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Japanese byo-yomi";
	gameType.nibName = @"JapaneseConfig";
	gameType.details =	@"Japanese/Byo-yomi Go/Weiqi/圍棋 Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: JapaneseID];
	[goGameTypes addObject: gameType];
	[gameType release];	
	
	gameType = [[GameType alloc] init];
	gameType.title = @"Japanese byo-yomi Overtime";
	gameType.nibName = @"JapaneseOvertimeConfig";
	gameType.details =	@"JapaneseOvertime Go/Weiqi/圍棋 Clock.";
	gameType.ctrlrID  = [NSNumber numberWithInt: JapaneseOvertimeID];
	[goGameTypes addObject: gameType];
	[gameType release];		
	
	
}

-(void) viewDidUnload {
	[super viewDidUnload];
	
	self.splitViewController = nil;
	self.rootPopoverButtonItem = nil;
}

#pragma mark -
#pragma mark Rotation support

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}


- (void)splitViewController:(UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController:(UIPopoverController*)pc {
    
    // Keep references to the popover controller and the popover button, and tell the detail view controller to show the button.
    barButtonItem.title = @"Menu";
    self.popoverController = pc;
    self.rootPopoverButtonItem = barButtonItem;
    ConfigViewController *detailViewCtrlr = [splitViewController.viewControllers objectAtIndex:1];
	
    [detailViewCtrlr showRootPopoverButtonItem:rootPopoverButtonItem];
}


- (void)splitViewController:(UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	
    // Nil out references to the popover controller and the popover button, and tell the detail view controller to hide the button.
    ConfigViewController *detailViewCtrlr = [splitViewController.viewControllers objectAtIndex:1];
    [detailViewCtrlr invalidateRootPopoverButtonItem:rootPopoverButtonItem];
    self.popoverController = nil;
    self.rootPopoverButtonItem = nil;
}


/*
 - (void)viewWillAppear:(BOOL)animated {
 [super viewWillAppear:animated];
 }
 */


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    // Return the number of sections.
    return 4;
}


- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
	
	if (section == 0){
		return [appInformationTypes count];
	}
	else if (section == 1){
		return [counterGameTypes count];
	}
	else if (section == 2){
		return [chessGameTypes count];
	}
	else {
		return [goGameTypes count];
	}
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	if (section == 0){
		return @"Help and About";
	}
	if (section == 1){
		return @"Counters";
	}
	else if (section ==2){
		return @"Chess";
	}
	else {
		return @"Go / Weiqi / 圍棋";
	}

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    // Dequeue or create a cell of the appropriate type.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
        cell.accessoryType = UITableViewCellAccessoryNone;
    }

	GameType *type = nil;
	
	if (indexPath.section == 0)	{	
		type = [appInformationTypes objectAtIndex:indexPath.row];
	}
	else if (indexPath.section == 1) {
		type = [counterGameTypes objectAtIndex:indexPath.row];
	}
	else if (indexPath.section == 2) {
		type = [chessGameTypes objectAtIndex:indexPath.row];
	}
	else {
		type = [goGameTypes objectAtIndex:indexPath.row];
	}
    
    // Configure the cell.
    cell.textLabel.text = type.title;
    return cell;
}


/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */


/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:YES];
 }   
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }   
 }
 */


/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */


/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

	GameType* type = nil;
	
	if (indexPath.section == 0){	
		type = [appInformationTypes objectAtIndex:indexPath.row];
	}
	else if (indexPath.section ==1){
		type = [counterGameTypes objectAtIndex:indexPath.row];
	}
	else if (indexPath.section ==2){
		type = [chessGameTypes objectAtIndex:indexPath.row];
	}
	else {
		type = [goGameTypes objectAtIndex:indexPath.row];
	}

	
	GameTimerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
	ConfigViewController * configViewContoller = [self newViewForType:type];
	
	
	//	appDelegate.splitViewController.delegate = configViewContoller; // so it recieves the rotation events	
	
	NSArray* controllers = [NSArray arrayWithObjects:[appDelegate.splitViewController.viewControllers objectAtIndex:0]
							, configViewContoller, nil];
	
	[configViewContoller release];
		
	appDelegate.splitViewController.viewControllers = controllers;	
		
	
    // Dismiss the popover if it's present.
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
    }
	
    // Configure the new view controller's popover button (after the view has been displayed and its toolbar/navigation bar has been created).
    if (rootPopoverButtonItem != nil) {
        [configViewContoller showRootPopoverButtonItem:self.rootPopoverButtonItem];
    }	
}

-(ConfigViewController*) newViewForType:(GameType*) type{
	
	ConfigViewController *configViewContoller = nil;
	
	if (type.ctrlrID == [NSNumber numberWithInt: CountDownID])
	{
		configViewContoller =[[CountDownConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];		
	}
	else if (type.ctrlrID == [NSNumber numberWithInt: CountUpID])
	{
		configViewContoller =[[CountUpConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];		
	}
	else if (type.ctrlrID == [NSNumber numberWithInt: HourGlassID])
	{
		configViewContoller =[[HourGlassConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}
	else if (type.ctrlrID == [NSNumber numberWithInt: SuddenDeathID])
	{
		configViewContoller =[[SuddenDeathConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}	
	else if (type.ctrlrID == [NSNumber numberWithInt: FischerID])
	{
		configViewContoller =[[FischerConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}		
	else if (type.ctrlrID == [NSNumber numberWithInt: BronsteinID])
	{
		configViewContoller =[[BronsteinConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}	
	else if (type.ctrlrID == [NSNumber numberWithInt: SimpleDelayID])
	{
		configViewContoller =[[SimpleDelayConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}		
	else if (type.ctrlrID == [NSNumber numberWithInt: CanadianID])
	{
		configViewContoller =[[CanadianConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}			
	else if (type.ctrlrID == [NSNumber numberWithInt: JapaneseID])
	{
		configViewContoller =[[JapaneseConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}			
	else if (type.ctrlrID == [NSNumber numberWithInt: JapaneseOvertimeID])
	{
		configViewContoller =[[JapaneseOvertimeConfig alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}		
	else if (type.ctrlrID == [NSNumber numberWithInt: AboutID])
	{
		configViewContoller =[[DetailViewController alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}		
	else if (type.ctrlrID == [NSNumber numberWithInt: HelpID])
	{
//		NSLog(type.nibName);
		configViewContoller =[[WebHelp alloc]
							  initWithNibName: type.nibName
							  bundle:nil];			
	}			
	
	
		
	return configViewContoller;
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}


- (void)dealloc {
    [detailViewController release];
	[appInformationTypes release];
	[counterGameTypes release];
	[chessGameTypes release];
	[goGameTypes release];
	
    [popoverController release];
    [rootPopoverButtonItem release];	
	
    [super dealloc];
}


@end

