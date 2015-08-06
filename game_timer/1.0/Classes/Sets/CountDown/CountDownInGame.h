//
//  CountDownInGame.h
//  GameTimer
//
//  Created by Mark Barber on 4/29/10.
//  Copyright 2010 Programmer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SingleStartInGame.h"
#import "Player.h"

@interface CountDownInGame : SingleStartInGame {

	Player* player;
	
	UIButton* timeButton;	

}
@property (nonatomic, retain) Player *player;


- (void) startClock;
- (void) stopClock;


@property (nonatomic, retain) IBOutlet UIButton *timeButton;


- (IBAction) toggleClock;
- (IBAction) resetClock;
- (IBAction) restartClock;

- (IBAction) timeClick;
@end
