//
//  C4View.m
//  C4iOS
//
//  Created by Travis Kirton on 12-02-14.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4View.h"
@interface C4View() 
-(void)animateWithBlock:(void (^)(void))blockAnimation;
-(void)animateWithBlock:(void (^)(void))blockAnimation completion:(void (^)(BOOL))completionBlock;
@end

@implementation C4View

/* leaving animation delay only to views for now */
@synthesize animationDuration, animationDelay, animationOptions = _animationOptions, repeatCount = _repeatCount;
@synthesize origin = _origin;

-(id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if(self != nil) {
        self.animationDuration = 0.0f;
        self.animationDelay = 0.0f;
        self.animationOptions = BEGINCURRENT;
        self.repeatCount = 0;
    }
    return self;
}

-(void)addShape:(C4Shape *)shape {
    NSAssert([shape isKindOfClass:[C4Shape class]],
             @"You tried to add something other than a C4Shape object using [canvas addShape:]");
    [self addSubview:shape];
}

-(void)addLabel:(C4Label *)label {
    NSAssert([label isKindOfClass:[C4Label class]], 
             @"You tried to add something other than a C4Label object using [canvas addLabel:]");
    [self addSubview:label];
}

-(void)addGL:(C4GL *)gl {
    NSAssert([gl isKindOfClass:[C4GL class]], 
             @"You tried to add something other than a C4GL object using [canvas addGL:]");
    [self addSubview:gl];
}

-(void)addImage:(C4Image *)image {
    NSAssert([image isKindOfClass:[C4Image class]],
             @"You tried to add something other than a C4Image object using [canvas addImage:]");
    [self addSubview:image];
}

-(void)addMovie:(C4Movie *)movie {
    NSAssert([movie isKindOfClass:[C4Movie class]],
             @"You tried to add something other than a C4Movie object using [canvas addMovie:]");
    [self addSubview:movie];
}

/* don't add this ever...
 creates a:
 CoreAnimation: failed to allocate 3145760 bytes
 wait_fences: failed to receive reply: 10004003
 
 -(void)drawRect:(CGRect)rect {
 [self.layer display];
 }
 */

-(void)setCenter:(CGPoint)center {
    CGPoint oldCenter = CGPointMake(self.center.x, self.center.y);
    [self animateWithBlock:^{
        [super setCenter:center];
    } completion:^(BOOL completed) {
        if ((self.animationOptions & AUTOREVERSE) == AUTOREVERSE && completed) {
            CGFloat oldDuration = self.animationDuration;
            CGFloat oldDelay = self.animationDelay;
            [super setCenter:oldCenter];
            self.animationDuration = oldDuration;
            self.animationDelay = oldDelay;
        }
    }];
}


-(void)setOrigin:(CGPoint)origin {
    _origin = origin;
    CGPoint difference = self.origin;
    difference.x += self.frame.size.width/2.0f;
    difference.y += self.frame.size.height/2.0f;
    self.center = difference;
}

-(void)setFrame:(CGRect)frame {
    CGRect oldFrame = self.frame;
    [self animateWithBlock:^{
        [super setFrame:frame];
    } completion:^(BOOL completed) {
        if ((self.animationOptions & AUTOREVERSE) == AUTOREVERSE && completed) {
            CGFloat oldDuration = self.animationDuration;
            CGFloat oldDelay = self.animationDelay;
            [super setFrame:oldFrame];
            self.animationDuration = oldDuration;
            self.animationDelay = oldDelay;
        }
    }];
}

-(void)setBounds:(CGRect)bounds {
    CGRect oldBounds = self.bounds;
    [self animateWithBlock:^{
        [super setBounds:bounds];
    } completion:^(BOOL completed) {
        if ((self.animationOptions & AUTOREVERSE) == AUTOREVERSE && completed) {
            CGFloat oldDuration = self.animationDuration;
            CGFloat oldDelay = self.animationDelay;
            [super setBounds:oldBounds];
            self.animationDuration = oldDuration;
            self.animationDelay = oldDelay;
        }
    }];
}

-(void)setTransform:(CGAffineTransform)transform {
    CGAffineTransform oldTransform = self.transform;
    [self animateWithBlock:^{
        [super setTransform:transform];
    } completion:^(BOOL completed) {
        if ((self.animationOptions & AUTOREVERSE) == AUTOREVERSE && completed) {
            CGFloat oldDuration = self.animationDuration;
            CGFloat oldDelay = self.animationDelay;
            [super setTransform:oldTransform];
            self.animationDuration = oldDuration;
            self.animationDelay = oldDelay;
        }
    }];
}

-(void)setAlpha:(CGFloat)alpha {
    CGFloat oldAlpha = self.alpha;
    [self animateWithBlock:^{
        [super setAlpha:alpha];
    } completion:^(BOOL completed) {
        if ((self.animationOptions & AUTOREVERSE) == AUTOREVERSE && completed) {
            CGFloat oldDuration = self.animationDuration;
            CGFloat oldDelay = self.animationDelay;
            [super setAlpha:oldAlpha];
            self.animationDuration = oldDuration;
            self.animationDelay = oldDelay;
        }
    }];
}

-(void)setBackgroundColor:(UIColor *)backgroundColor {
    UIColor *oldBackgroundColor = self.backgroundColor;
    [self animateWithBlock:^{
        [super setBackgroundColor:backgroundColor];
    } completion:^(BOOL completed) {
        if ((self.animationOptions & AUTOREVERSE) == AUTOREVERSE && completed) {
            CGFloat oldDuration = self.animationDuration;
            CGFloat oldDelay = self.animationDelay;
            [super setBackgroundColor:oldBackgroundColor];
            self.animationDuration = oldDuration;
            self.animationDelay = oldDelay;
        }
    }];
}

-(void)setContentStretch:(CGRect)contentStretch {
    CGRect oldContentStretch = self.contentStretch;
    [self animateWithBlock:^{
        [super setContentStretch:contentStretch];
    } completion:^(BOOL completed) {
        if ((self.animationOptions & AUTOREVERSE) == AUTOREVERSE && completed) {
            CGFloat oldDuration = self.animationDuration;
            CGFloat oldDelay = self.animationDelay;
            [super setContentStretch:oldContentStretch];
            self.animationDuration = oldDuration;
            self.animationDelay = oldDelay;
        }
    }];
}

-(void)animateWithBlock:(void (^)(void))animationBlock {
    [self animateWithBlock:animationBlock completion:nil];
};

-(void)animateWithBlock:(void (^)(void))animationBlock completion:(void (^)(BOOL))completionBlock {
    [UIView animateWithDuration:self.animationDuration
                          delay:(NSTimeInterval)self.animationDelay
                        options:self.animationOptions
                     animations:animationBlock
                     completion:completionBlock];
};

-(void)setAnimationOptions:(NSUInteger)animationOptions {
    _animationOptions = animationOptions;
}

#pragma mark Notification Methods
-(void)setup {}

-(void)listenFor:(NSString *)notification andRunMethod:(NSString *)methodName{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(methodName) name:notification object:nil];
}

-(void)listenFor:(NSString *)notification fromObject:(id)object andRunMethod:(NSString *)methodName {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:NSSelectorFromString(methodName) name:notification object:object];
}

-(void)stopListeningFor:(NSString *)methodName {
    [self stopListeningFor:methodName object:nil];
}

-(void)stopListeningFor:(NSString *)methodName object:(id)object {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:methodName object:object];
}

-(void)postNotification:(NSString *)notification {
	[[NSNotificationCenter defaultCenter] postNotificationName:notification object:self];
}

@end
