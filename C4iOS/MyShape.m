//
//  MyShape.m
//  C4iOS
//
//  Created by Travis Kirton on 12-05-08.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "MyShape.h"

@implementation MyShape {
C4Sample *sample;

float time;
float sNewTime;
float sOldTime;
}


@synthesize playhead;



-(id)initWithSample: (C4Sample *)mySample WithFrame:(CGRect)myRect{
    self = [super init];
    if(self != nil) {
        
        CGRect newFrame = myRect;
        self.strokeColor = C4GREY;
        self.animationDuration = 0.0f;
        self.lineWidth = 0.5f;
        [self rect:newFrame];

        CGPoint pointArray[2] = {CGPointZero,CGPointMake(0, newFrame.size.height)};
        playhead = [C4Shape line:pointArray];
        playhead.animationDuration = 0.0f;
        playhead.strokeColor = C4GREY;
        playhead.animationOptions = LINEAR;
        [self addSubview:playhead];
        
        sample = mySample;
        [sample play];
        sample.loops = YES;
        
        NSTimer* timer = [NSTimer timerWithTimeInterval:0.01f target:self selector:@selector(updateView) userInfo:nil repeats:YES];
        [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    }
    return self;
}

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    sOldTime = sample.currentTime;
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchLocation = [touch locationInView:self];
    sNewTime = (touchLocation.x / self.frame.size.width) * sample.duration;
    sample.currentTime = sNewTime;
    [sample play];
    
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    sample.currentTime = sOldTime + (sample.currentTime - sNewTime);
    [sample play];
    
}

-(void) updateView {
    
    time = sample.currentTime;
    playhead.center = CGPointMake(((time/sample.duration) * self.frame.size.width),self.frame.size.height/2);
    
}

@end
