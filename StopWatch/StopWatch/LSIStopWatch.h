//
//  LSIStopWatch.h
//  StopWatchDemo
//
//  Created by Paul Solt on 4/9/19.
//  Copyright © 2019 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSIStopWatch : NSObject

@property (nonatomic, readonly, getter=isRunning) BOOL running;
@property (nonatomic, readonly) NSTimeInterval elapsedTime; // Elapsed time in seconds.

- (void)start;
- (void)stop;
- (void)reset;

@end

NS_ASSUME_NONNULL_END
