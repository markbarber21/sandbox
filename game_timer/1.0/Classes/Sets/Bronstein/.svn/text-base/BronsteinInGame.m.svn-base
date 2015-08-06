//
//  BronsteinInGame.m
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "BronsteinInGame.h"
#import "Helper.h"

@implementation BronsteinInGame

@synthesize additionalTurnTotal;


- (void) leftPlayerStart {
	
	if ([self gameActive])
		[rightPlayer addBronsteinTime:additionalTurnTotal];
	
	[rightPlayer turnEnd];	
	[leftPlayer turnStart];
}


- (void) rightPlayerStart {
	
	if ([self gameActive])	
		[leftPlayer addBronsteinTime:additionalTurnTotal];	
	
	[leftPlayer turnEnd];
	[rightPlayer turnStart];
}



@end
