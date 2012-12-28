//
//  Response.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 6/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Response : NSObject{
    BOOL isSuccessful;
    NSString * errorMessage;
    NSObject * object;
}
@property (nonatomic, assign) BOOL isSuccessful;
@property (nonatomic, retain) NSString * errorMessage;
@property (nonatomic, retain) NSObject * object;

@end
