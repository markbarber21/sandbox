//
//  HourGlassInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "HourGlassInGame.h"
#import "Helper.h"

@implementation HourGlassInGame


// State Functions

- (void) leftPlayerStart {
	[rightPlayer turnEnd];	// Calc lost Time
	[leftPlayer turnEnd];	// Calc earned Time
	
	
	[leftPlayer turnStart];
	[rightPlayer startEarningOthersTime];	
}


- (void) rightPlayerStart {
	[leftPlayer turnEnd];	// Calc lost Time
	[rightPlayer turnEnd];	// Calc earned Time
	
	[rightPlayer turnStart];
	[leftPlayer startEarningOthersTime];
}


@end
