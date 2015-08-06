//
//  Player.h
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//


@interface Player : NSObject {

	bool paused;	
	bool inOvertime;
	NSDate *turnStartTime;
	NSDate *earnOthersTime;	
	
	NSTimeInterval currentTotal;
	NSTimeInterval delayAmount;
	
	NSInteger turnsCompleted;
	NSInteger periods;
}

@property (nonatomic, retain) NSDate *turnStartTime;
@property (nonatomic, retain) NSDate *earnOthersTime;

// State Accessors
- (void)			resetPlayer:(NSTimeInterval) startTime;
- (void)			togglePlayerTurn;
- (void)			turnStart;
- (void)			turnEnd;
- (void)			pauseTurn;
- (void)			addTime:(NSTimeInterval) time;
- (void)			addBronsteinTime:(NSTimeInterval) time;
- (void)			addSimpleDelayTime:(NSTimeInterval) time;

// Special State Setters
- (void)			startEarningOthersTime;
- (void)			startNewPeriod:(NSTimeInterval) startTime;
- (void)			startNewOTPeriod:(NSTimeInterval) startTime;
- (void)			resetTimeWithinPlay:(NSTimeInterval) startTime;
- (void)			incrementTimeWithinPlay;

// Accessors
- (NSInteger)		getNumberOfTurns;
- (NSInteger)		getNumberOfPeriods;
- (bool)			isInOT;

// Helper

- (NSTimeInterval)	timeGoneBy;
- (NSTimeInterval)	delayTimeLeft;

// Data Accessors
- (NSTimeInterval)	getTimeDelta;
- (bool)			isPaused;

@end
