//
//  C4WorkSpace.m
//  C4iOS
//
//  Created by Travis Kirton on 12-03-12.
//  Copyright (c) 2012 POSTFL. All rights reserved.
//

#import "C4WorkSpace.h"
#import "MyShape.h"

@implementation C4WorkSpace {
    MyShape *m;
}

-(void)setup {
    //m = [MyShape alloc] initWithSample:(C4Sam WithFrame:<#(CGRect)#>;
    m = [[MyShape alloc] initWithSample:[C4Sample sampleNamed:@"RCSNIP1.wav"] 
                              WithFrame:CGRectMake(100, 100, 500, 100)];
    
//    [MyShape new] = [[MyShape alloc] init];
    [self.canvas addShape:m];
}

@end