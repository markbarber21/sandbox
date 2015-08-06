//
//  SingleStartInGame.h
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import <UIKit/UIKit.h>


@interface SingleStartInGame : UIViewController <UIAlertViewDelegate>{
	NSTimeInterval startTotal;
	NSTimer *clockViewUpdateTimer;	
	
	bool endGame;
}


// My Class-Interface Functions
- (void) updateInterface;
- (void) endTheGame;




// IB
@property (nonatomic) NSTimeInterval startTotal;
- (IBAction) editConfig;
- (void) goBackToConfig;

// Helpers
- (void) startEventLoop;
- (void) clockEventLoop;


@end
