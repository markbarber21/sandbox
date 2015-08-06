//
//  JapaneseOvertimeConfig.h
//  GameTimer
//
//  Created by Mark Barber on 6/17/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "SingeStartTurnBonusConfig.h"

@interface JapaneseOvertimeConfig : SingleStartConfig {
	NSInteger timePeriods;
	UILabel *turnLabel;
	NSTimeInterval perPeriodTotal;
	UILabel *perPeriodLabel;
}

- (void) updateTurnCount;
- (void) updateLabels;

- (void) updatePeriodTotal;
- (void) updatePeriodLabels;

@property (nonatomic, retain) IBOutlet UILabel *turnLabel;
@property (nonatomic, retain) IBOutlet UILabel *perPeriodLabel;


- (IBAction) addTurnCount;
- (IBAction) subTurnCount;

- (IBAction) addMinPerPer;
- (IBAction) subMinPerPer;
- (IBAction) addSecPerPer;
- (IBAction) subSecPerPer;

- (IBAction) goInGame;

@end
