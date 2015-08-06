//
//  SingleStartConfig.h
//  GameTimer
//
//  Created by Mark Barber on 6/12/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConfigViewController.h"

@interface SingleStartConfig : ConfigViewController {
	NSTimeInterval startTotal;
	UILabel *singleTime;
}

// IB properties
@property (nonatomic, retain) IBOutlet UILabel *singleTime;

- (IBAction) addHour;
- (IBAction) subHour;

- (IBAction) addMin;
- (IBAction) subMin;

- (IBAction) addSec;
- (IBAction) subSec;


// 
- (void) updateTime;
- (void) updateLabels;

- (void) loadPrefs;
- (void) savePrefs;

- (NSString*) prefID;

@end
