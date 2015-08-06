//
//  CanadianInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/16/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "CanadianInGame.h"
#import "Helper.h"

@implementation CanadianInGame

- (void) viewDidLoad {
	[super viewDidLoad];
	
	leftLowerLbl.text = @"Moves Left:";
	rightLowerLbl.text = @"Moves Left:";
}

- (void)dealloc {
    [super dealloc];
}


- (void) setStonesPerTimePeriod:(NSInteger) num
{
	stonesPerTimePeriod = num;
}

- (void) leftPlayerStart {


	[rightPlayer turnEnd];	
	

	if ([rightPlayer getNumberOfTurns] >= stonesPerTimePeriod)
	{
		[rightPlayer resetPlayer:startTotal];
	}
	
	[leftPlayer turnStart];
}


- (void) rightPlayerStart {


	[leftPlayer turnEnd];
	
	if ([leftPlayer getNumberOfTurns] >= stonesPerTimePeriod)
	{
		[leftPlayer resetPlayer:startTotal];
	}	
	
	[rightPlayer turnStart];
}

- (void) updateInterface {

	[super updateInterface];		
	
	leftLowerValue.text = [NSString stringWithFormat:@"%02d"
						   , stonesPerTimePeriod - [leftPlayer getNumberOfTurns]];
	rightLowerValue.text = [NSString stringWithFormat:@"%02d"
							, stonesPerTimePeriod - [rightPlayer getNumberOfTurns]];
}



@end
