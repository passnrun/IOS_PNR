//
//  Position.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 12/30/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Position : NSObject{
    NSString * side;
    NSString * position;
}

- (id) initWithCode :(NSString *) code;
- (int) positionIndex;
- (int) match:(Position *) p;

@property (nonatomic, strong) NSString * side;
@property (nonatomic, strong) NSString * position;

@end
