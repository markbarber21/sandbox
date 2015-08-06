//
//  JapaneseConfig.h
//  GameTimer
//
//  Created by Mark Barber on 6/16/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "SingeStartTurnBonusConfig.h"

@interface JapaneseConfig : SingleStartConfig {
	NSInteger timePeriods;
	UILabel *turnLabel;
}

- (void) updateTurnCount;
- (void) updateLabels;

@property (nonatomic, retain) IBOutlet UILabel *turnLabel;


- (IBAction) addTurnCount;
- (IBAction) subTurnCount;

- (IBAction) goInGame;

@end
