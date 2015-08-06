//
//  JapaneseInGame.h
//  GameTimer
//
//  Created by Mark Barber on 6/16/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "BackAndForthInGame.h"

@interface JapaneseInGame : BackAndForthInGame {
	NSInteger timePeriods;
}

- (void) setTimePeriods:(NSInteger) num;

@end
