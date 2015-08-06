//
//  JapaneseOvertimeInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/1/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "JapaneseOvertimeInGame.h"
#import "Helper.h"

@implementation JapaneseOvertimeInGame


- (void) viewDidLoad {
	[super viewDidLoad];	
}


- (void)dealloc {
    [super dealloc];
	
}


- (void) setTimePeriods:(NSInteger) num
{
	timePeriods = num;
}

- (void) setPerPeriodTotal:(NSTimeInterval) time {
	perPeriodTotal = time;
}

- (void) leftPlayerStart {

	[rightPlayer turnEnd];	
	
	if ([rightPlayer isInOT])
		[rightPlayer resetTimeWithinPlay:perPeriodTotal];
	
	[leftPlayer turnStart];
}


- (void) rightPlayerStart {

	[leftPlayer turnEnd];
	
	if ([leftPlayer isInOT])
		[leftPlayer resetTimeWithinPlay:perPeriodTotal];
	
	[rightPlayer turnStart];
}

- (void) internalResetClock {
	[super internalResetClock];

	leftLowerLbl.text = @"";
	leftLowerValue.text = @"";
	rightLowerLbl.text = @"";	
	rightLowerValue.text = @"";
}

- (void) updateInterface {

	if ([leftPlayer getTimeDelta] <= 0) {
		[leftPlayer startNewOTPeriod:perPeriodTotal+[leftPlayer getTimeDelta]];
	}
	
	if ([rightPlayer getTimeDelta] <= 0) {
		[rightPlayer startNewOTPeriod:perPeriodTotal+[rightPlayer getTimeDelta]];			
	}
	
	if ([leftPlayer isInOT]) {
		leftLowerLbl.text = @"Periods Remaining:";
		leftLowerValue.text = [NSString stringWithFormat:@"%03d"
							   , timePeriods - [leftPlayer getNumberOfPeriods]];
	}
	
	if ([rightPlayer isInOT]) {
		rightLowerLbl.text = @"Periods Remaining:";	
		rightLowerValue.text = [NSString stringWithFormat:@"%03d"
								, timePeriods - [rightPlayer getNumberOfPeriods]];
	}
	
	[super updateInterface];	
	
	{
		if ([leftPlayer getNumberOfPeriods] >= timePeriods){
			[self endTheGame];
			leftLabel.text = @"Time Up";
		}
		
		if ([rightPlayer getNumberOfPeriods] >= timePeriods){
			[self endTheGame];
			rightLabel.text = @"Time Up";
		}	
	}		
}

- (void)	updateClockLabels {
	NSTimeInterval lRemain = [leftPlayer getTimeDelta];
	leftLabel.text = [Helper myTimeString:(lRemain)];

	NSTimeInterval rRemain = [rightPlayer getTimeDelta];	
	rightLabel.text = [Helper myTimeString:(rRemain)];
}


@end
