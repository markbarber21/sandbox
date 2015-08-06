//
//  FischerInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "FischerInGame.h"
#import "Helper.h"

@implementation FischerInGame

@synthesize additionalTurnTotal;



- (void) leftPlayerStart {

	if ([self gameActive])
		[rightPlayer addTime:additionalTurnTotal];
	
	[rightPlayer turnEnd];	
	[leftPlayer turnStart];
}


- (void) rightPlayerStart {

	if ([self gameActive])	
		[leftPlayer addTime:additionalTurnTotal];	

	[leftPlayer turnEnd];
	[rightPlayer turnStart];
}



@end
