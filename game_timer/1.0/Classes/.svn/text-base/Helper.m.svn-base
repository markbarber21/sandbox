//
//  Helper.m
//  GameTimer
//
//  Created by Mark Barber on 4/29/10.
//  Copyright 2010 Programmer. All rights reserved.
//

#import "Helper.h"


@implementation Helper


+ (NSString*) myTimeString:(NSTimeInterval) time{
	
	NSInteger hour =	[self getHours:time];
	NSInteger minute =	[self getMin:time];
	NSInteger second =	[self getSec:time];
	
	if (second == 60){
		minute ++;
		second = 0;
	}
	
	if (minute == 60){
		hour ++;
		minute = 0;
	}
	
	return [NSString stringWithFormat:@"%02d:%02d:%02d",hour,minute,second];
//	return [self timeFormatter:time];
}

//+ (NSString*) myTimeStringPrecise:(NSTimeInterval) time{
//	return [NSString stringWithFormat:@"%02d:%02d:%02d.%01d"
//			, [self getHours:time]
//			, [self getMin:time]
//			, [self getSec:time]
//			, [self getTsec:time]];
//}

+ (NSString*) myTimeStringMS:(NSTimeInterval) time{
	return [NSString stringWithFormat:@"%02d:%02d", [self getMin:time], [self getSec:time]];
}

+ (NSInteger) getHours:(NSTimeInterval) time{
	return time/(60*60);
}
+ (NSInteger) getMin:(NSTimeInterval) time{
	return (time/60)-(60*[self getHours:time]);
}
+ (NSInteger) getSec:(NSTimeInterval) time{
	NSTimeInterval seconds = time - (60*60*[self getHours:time]) - (60*[self getMin:time]);
	return ceil(seconds);
}

+ (NSInteger) getTsec:(NSTimeInterval) time
{
	long wholePart = time;
	time -= wholePart;
	time *= 10;
	time = (long)time;	
	
	return time;
}

+ (NSString*) timeFormatter:(NSTimeInterval) theTimeInterval {
	// Get the system calendar
	NSCalendar *sysCalendar = [NSCalendar currentCalendar];
	
	// Create the NSDates
	NSDate *date1 = [[NSDate alloc] init];
	NSDate *date2 = [[NSDate alloc] initWithTimeInterval:theTimeInterval+1 sinceDate:date1]; 
	
	// Get conversion to months, days, hours, minutes
	unsigned int unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;	
	NSDateComponents *conversionInfo = [sysCalendar components:unitFlags fromDate:date1  toDate:date2  options: NSWrapCalendarComponents];
	
	NSInteger hour = [conversionInfo hour];
	NSInteger minute = [conversionInfo minute];
	NSInteger second = [conversionInfo second];
	
	[date1 release];
	[date2 release];	
	
	return [NSString stringWithFormat:@"%02d:%02d:%02d", hour, minute, second];
}


+ (void) noStartTimeError {
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error." message:@"You have not specified a start time."
												   delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
	[alert show];
	[alert release];
	
}


@end
