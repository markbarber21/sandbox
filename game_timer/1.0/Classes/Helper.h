//
//  Helper.h
//  GameTimer
//
//  Created by Mark Barber on 4/29/10.
//  Copyright 2010 Programmer. All rights reserved.
//


@interface Helper : NSObject {

}

+ (NSString*) myTimeString:(NSTimeInterval) time;
+ (NSString*) myTimeStringMS:(NSTimeInterval) time;

+ (NSInteger) getHours:(NSTimeInterval) time;
+ (NSInteger) getMin:(NSTimeInterval) time;
+ (NSInteger) getSec:(NSTimeInterval) time;
+ (NSInteger) getTsec:(NSTimeInterval) time;

+ (NSString*) timeFormatter:(NSTimeInterval) theTimeInterval;

+ (void) noStartTimeError;

@end
