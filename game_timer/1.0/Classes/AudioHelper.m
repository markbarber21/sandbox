//
//  AudioHelper.m
//  GameTimer
//
//  Created by Mark Barber on 6/21/10.
//  Copyright 2010 Evelyn Manufacturing . All rights reserved.
//

#import "AudioHelper.h"

@implementation AudioHelper

+ (id)soundEffectWithContentsOfFile:(NSString *)aPath {

    if (aPath) {

        return [[[AudioHelper alloc] initWithContentsOfFile:aPath] autorelease];

    }

    return nil;

}

 

- (id)initWithContentsOfFile:(NSString *)path {

    self = [super init];

    

    if (self != nil) {

        NSURL *aFileURL = [NSURL fileURLWithPath:path isDirectory:NO];

        

        if (aFileURL != nil)  {

            SystemSoundID aSoundID;

            OSStatus error = AudioServicesCreateSystemSoundID((CFURLRef)aFileURL, &aSoundID);

            

            if (error == kAudioServicesNoError) { // success

                _soundID = aSoundID;

            } else {

                NSLog(@"Error %d loading sound at path: %@", error, path);

                [self release], self = nil;

            }

        } else {

            NSLog(@"NSURL is nil for path: %@", path);

            [self release], self = nil;

        }

    }

    return self;

}

 

-(void)dealloc {

    AudioServicesDisposeSystemSoundID(_soundID);

    [super dealloc];

}

 

-(void)play {

    AudioServicesPlaySystemSound(_soundID);

}

 

@end