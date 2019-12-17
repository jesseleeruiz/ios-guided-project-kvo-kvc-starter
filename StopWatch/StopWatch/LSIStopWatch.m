//
//  LSIStopWatch.m
//  StopWatchDemo
//
//  Created by Paul Solt on 4/9/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import "LSIStopWatch.h"

@interface LSIStopWatch ()

@property (nonatomic, readwrite, getter=isRunning) BOOL running;
@property (nonatomic, readwrite) NSTimeInterval elapsedTime;

@property (nonatomic) NSDate *startDate;
@property (nonatomic) NSTimer *timer;

@property (nonatomic) NSTimeInterval previouslyAccumulatedTime;

@end

@implementation LSIStopWatch

- (void)start {
    self.startDate = [NSDate date];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                  target:self
                                                selector:@selector(updateTimer:)
                                                userInfo:nil
                                                 repeats:YES];
    self.running = YES;
    
}

- (void)stop {
    self.previouslyAccumulatedTime = self.elapsedTime;
    self.timer = nil;
    self.startDate = nil;
    self.running = NO;
}

- (void)reset {
    [self stop];
    self.elapsedTime = 0;
    self.previouslyAccumulatedTime = 0;
}

- (void)updateTimer:(NSTimer *)timer; {
	// If you pause/start the timer it will keep track of the original
	// time so it doesn't start from 0 each time
	
    self.elapsedTime = [[NSDate date] timeIntervalSinceDate:self.startDate] + self.previouslyAccumulatedTime;
}

#pragma mark - Properties

- (void)setTimer:(NSTimer *)timer {
    if (timer != _timer) {
        [_timer invalidate]; // Make sure the previous timer stops
        _timer = timer;
    }
}

@end
