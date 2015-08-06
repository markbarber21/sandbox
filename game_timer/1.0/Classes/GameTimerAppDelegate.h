//
//  GameTimerAppDelegate.h
//  GameTimer
//
//  Created by Mark Barber on 4/28/10.
//  Copyright Mark Barber  2010. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RootViewController;
@class DetailViewController;
@class AudioHelper;

@interface GameTimerAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    
    UISplitViewController *splitViewController;
    
    RootViewController *rootViewController;
    DetailViewController *detailViewController;
	UIViewController *inGameViewController;
	
	//Sounds
	
    AudioHelper *clickSound;
	AudioHelper *switchTurn;
	AudioHelper *gameEnd;
	
	NSTimeInterval lastClick;	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UISplitViewController *splitViewController;
@property (nonatomic, retain) IBOutlet RootViewController *rootViewController;
@property (nonatomic, retain) IBOutlet DetailViewController *detailViewController;

@property (nonatomic, retain) UIViewController* inGameViewController;

- (void) switchToInGameView:(UIViewController*) controller;
- (void) switchToMainConfigView;

- (void) playClick;
- (void) playTurnChange;
- (void) playTimeUp;

@end
