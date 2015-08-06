//
//  FischerInGame.h
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import "BackAndForthInGame.h"

@interface FischerInGame : BackAndForthInGame {
	NSTimeInterval additionalTurnTotal;
}

@property (nonatomic) NSTimeInterval additionalTurnTotal;

@end
