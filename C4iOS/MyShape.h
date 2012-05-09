//
//  MyShape.h
//  C4iOS
//
//  Created by Travis Kirton on 12-05-08.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4Shape.h"

@interface MyShape : C4Shape
-(id)initWithSample:(C4Sample *)mySample WithFrame:(CGRect)myRect;

@property (readwrite, strong) C4Shape *playhead;
@end
