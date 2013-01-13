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
    int nid;
    int managerId;
    NSString * subject;
    NSString * date;
    NSString * content;
}

@property(nonatomic,assign) int nid;
@property(nonatomic,assign) int managerId;
@property(nonatomic,strong) NSString * subject;
@property(nonatomic,strong) NSString * date;
@property(nonatomic,strong) NSString * content;

- (id)initWithDictionarty :(NSDictionary *)data;

@end
