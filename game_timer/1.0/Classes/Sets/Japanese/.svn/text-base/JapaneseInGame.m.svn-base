//
//  JapaneseInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/16/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "JapaneseInGame.h"
#import "Helper.h"

@implementation JapaneseInGame

- (void) viewDidLoad {
	[super viewDidLoad];
	
	leftLowerLbl.text = @"Periods Remaining:";
	rightLowerLbl.text = @"Periods Remaining:";
}

- (void)dealloc {
    [super dealloc];
	
}


- (void) setTimePeriods:(NSInteger) num
{
	timePeriods = num;
}

- (void) leftPlayerStart {

	[rightPlayer turnEnd];	
	[rightPlayer resetTimeWithinPlay:startTotal];
	
	[leftPlayer turnStart];
}


- (void) rightPlayerStart {

	[leftPlayer turnEnd];
	[leftPlayer resetTimeWithinPlay:startTotal];
	
	[rightPlayer turnStart];
}

- (void) updateInterface {

	if ([leftPlayer getTimeDelta] <= 0) {
		[leftPlayer startNewPeriod:startTotal+[leftPlayer getTimeDelta]];
	}
	
	if ([rightPlayer getTimeDelta] <= 0) {
		[rightPlayer startNewPeriod:startTotal+[rightPlayer getTimeDelta]];
	}
	
	leftLowerValue.text = [NSString stringWithFormat:@"%03d"
						   , timePeriods - [leftPlayer getNumberOfPeriods]];
	rightLowerValue.text = [NSString stringWithFormat:@"%03d"
							, timePeriods - [rightPlayer getNumberOfPeriods]];
	
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
