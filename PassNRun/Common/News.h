//
//  News.h
//  PassNRun
//
//  Created by Onur Idrisoglu on 9/24/12.
//  Copyright (c) 2012 PNR. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject
{
    int id;
    NSString * subject;
    NSString * date;
    NSString * content;
}

@property(nonatomic,assign) int id;
@property(nonatomic,strong) NSString * subject;
@property(nonatomic,strong) NSString * date;
@property(nonatomic,strong) NSString * content;

@end
