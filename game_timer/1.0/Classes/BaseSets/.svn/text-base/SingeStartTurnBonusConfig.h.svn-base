//
//  SingeStartTurnBonusConfig.h
//  GameTimer
//
//  Created by Mark Barber on 6/14/10.
//  Copyright 2010 Programmer. All rights reserved.
//

#import "SingleStartConfig.h"


@interface SingeStartTurnBonusConfig : SingleStartConfig {
	NSTimeInterval additionalTurnTotal;
	UILabel *turnTime;
}

- (void) updateTurnTime;
- (void) updateLabels;

@property (nonatomic, retain) IBOutlet UILabel *turnTime;

- (IBAction) addTurnMin;
- (IBAction) subTurnMin;

- (IBAction) addTurnSec;
- (IBAction) subTurnSec;



@end
