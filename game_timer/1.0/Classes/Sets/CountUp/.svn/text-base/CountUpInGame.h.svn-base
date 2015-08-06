//
//  CountUpInGame.h
//  GameTimer
//
//  Created by Mark Barber on 6/1/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CountUpInGame : UIViewController <UIAlertViewDelegate>{
	
	NSTimer *updateTimer;	
	bool paused;
	
	NSDate * lastClick;
	NSTimeInterval currentTotal;
	
	UIButton* timeButton;

}

- (void) startEventLoop;
- (void) clockEventLoop;
- (NSTimeInterval) getTimeGoneBy;

- (void) start;
- (void) pause;


// Interface Builder tie-ins

@property (nonatomic, retain) IBOutlet UIButton *timeButton;

- (IBAction) editConfig;
- (void) goBackToConfig;

- (IBAction) toggleClock;
- (IBAction) resetClock;
- (IBAction) restartClock;
- (void) internalResetClock;
- (IBAction) timeClick;

@end
