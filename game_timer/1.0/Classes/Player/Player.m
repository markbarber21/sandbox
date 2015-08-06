//
//  Player.m
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "Player.h"


@implementation Player

@synthesize turnStartTime, earnOthersTime;


- (id)init

{
	
    self = [super init];
	
    if (self) {
		delayAmount = 0;
		turnsCompleted = 0;
		periods = 0;
    }
	
    return self;
}

- (void)dealloc {
	[turnStartTime release];
	
	if (earnOthersTime)
		[earnOthersTime release];
	
    [super dealloc];
}



- (void) resetPlayer:(NSTimeInterval) startTime {
	
	currentTotal = startTime;
	paused = TRUE;
	inOvertime = FALSE;
	turnsCompleted = 0;
	periods = 0;
	
	if (earnOthersTime)
	{	
		[earnOthersTime release];
		earnOthersTime = nil;
	}		
}

- (void) startNewPeriod:(NSTimeInterval) startTime; {

	periods++;
	
	[self turnStart];
	[self resetTimeWithinPlay:startTime];
}

- (void) startNewOTPeriod:(NSTimeInterval) startTime; {
	
	if (inOvertime)
		periods++;
	
	[self turnStart];
	[self resetTimeWithinPlay:startTime];
	
	inOvertime = TRUE;
}

- (bool) isInOT {
	return inOvertime;
}


- (void) resetTimeWithinPlay:(NSTimeInterval) startTime {
	currentTotal = startTime;
}
	
- (void) incrementTimeWithinPlay {
	currentTotal+=30;
}
	

- (void) turnStart {
	[turnStartTime release];
	turnStartTime = [NSDate date];
	[turnStartTime retain];
	
	paused = FALSE;
	
}


- (void) turnEnd {
	if (!paused)
		turnsCompleted++;
	
	[self pauseTurn];	
}

// Calculates the time delta and pauses state
- (void) pauseTurn {
	currentTotal = [self getTimeDelta];
	paused = TRUE;
	
	if (earnOthersTime)
	{	
		[earnOthersTime release];
		earnOthersTime = nil;
	}	
}

- (void) addTime:(NSTimeInterval) time{
	currentTotal += time;
}

- (void) addBronsteinTime:(NSTimeInterval) time {
	NSTimeInterval timeGoneBy = [self timeGoneBy];

	if (timeGoneBy > time)
		currentTotal += time;
	else {
		currentTotal += timeGoneBy;
	}	
}

- (void) addSimpleDelayTime:(NSTimeInterval) time {
	delayAmount = time;
}

- (void) togglePlayerTurn {
	if (paused){		
		[self turnStart];
	}
	else {		
		[self turnEnd];
	}
}

- (void) startEarningOthersTime {
	[earnOthersTime release];
	earnOthersTime = [NSDate date];
	[earnOthersTime retain];
}

-(NSInteger) getNumberOfTurns {
	return turnsCompleted;
}

-(NSInteger) getNumberOfPeriods {
	return periods;
}

- (NSTimeInterval) timeGoneBy {
	NSDate* now = [NSDate date];
	[now retain];	
	
	NSTimeInterval timeGoneBy = [now timeIntervalSinceDate:turnStartTime];
	timeGoneBy = timeGoneBy;
	
	[now release];
	
	return timeGoneBy;
}

- (NSTimeInterval) getTimeDelta {

	NSTimeInterval timeLeft = 0;

	if (paused){
		if (earnOthersTime) {
			NSDate* now = [NSDate date];
			[now retain];	
			
			NSTimeInterval earnedTimeGoneBy = [now timeIntervalSinceDate:earnOthersTime];
			timeLeft = currentTotal + earnedTimeGoneBy;	
			
			[now release];
		}
		else {
			timeLeft = currentTotal;
		}			
	}
	else {
		NSTimeInterval timeGoneBy = [self timeGoneBy];
		
		if (delayAmount){
			if (timeGoneBy > delayAmount){
				timeGoneBy -= delayAmount;
			}
			else {
				timeGoneBy = 0; // less than delay
			}
			
			timeLeft = currentTotal - timeGoneBy;
		}
		else {
			timeLeft = currentTotal - timeGoneBy;
		}
	}
	
	return timeLeft;
}

- (NSTimeInterval) delayTimeLeft {
	if (paused || !delayAmount) {
		return 0;
	}
	else {
		
		NSTimeInterval timeGoneBy = [self timeGoneBy];
		
		if (timeGoneBy > delayAmount){
			return 0;
		}
		else {
			
			return delayAmount - timeGoneBy;
		}
	}
}

- (bool) isPaused {
	return paused;
}

@end
