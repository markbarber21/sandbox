//
//  BackAndForthInGame.h
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "SingleStartInGame.h"
#import "Player.h"

@interface BackAndForthInGame : SingleStartInGame {
	
	UIButton* leftButton;
	UIButton* rightButton;
	
	UILabel* leftLabel;
	UILabel* rightLabel;
	
	Player* leftPlayer;
	Player* rightPlayer;
	
	
	UILabel* leftLowerLbl;
	UILabel* rightLowerLbl;
	UILabel* leftLowerValue;
	UILabel* rightLowerValue;
	
	bool isMyEvent;
}

@property (nonatomic, retain) IBOutlet UIButton *leftButton;
@property (nonatomic, retain) IBOutlet UIButton *rightButton;

@property (nonatomic, retain) IBOutlet UILabel *leftLabel;
@property (nonatomic, retain) IBOutlet UILabel *rightLabel;

@property (nonatomic, retain) IBOutlet UILabel *leftLowerLbl;
@property (nonatomic, retain) IBOutlet UILabel *rightLowerLbl;
@property (nonatomic, retain) IBOutlet UILabel *leftLowerValue;
@property (nonatomic, retain) IBOutlet UILabel *rightLowerValue;


- (IBAction) resetClock;
- (void)	 internalResetClock;
- (IBAction) pauseClock;

- (IBAction) leftButtonPush;
- (IBAction) rightButtonPush;

- (IBAction) leftPlayerCheat;
- (IBAction) rightPlayerCheat;

//

- (void)	leftPlayerStart;
- (void)	rightPlayerStart;

- (void)	updateClockLabels;
- (void)	updateButtons;


- (bool)	gameActive;

- (UIImage *)loadImage:(NSString *)name;

@end