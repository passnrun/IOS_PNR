//
//  JSONParser.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 3/10/12.
//  Copyright 2012 passnrun. All rights reserved.
//

#import "JSONParser.h"
@interface JSONParser(){
	
}
+ (NSString *)strip: (NSString *) val;
@end

@implementation JSONParser

+ (NSMutableDictionary *)parse:(NSString *)msg
{
	//NSLog(@"parsing:\n%@",msg);
	NSMutableDictionary * map = [NSMutableDictionary dictionary]; 
	BOOL began = NO;
	BOOL isKey = YES;
	BOOL isList = NO;
	NSString * currentKey = @"";
	NSString * currentValue = @"";
	NSMutableArray * currentList = [NSMutableArray arrayWithCapacity:16];
	int numOfBrankets = 0;
	BOOL hasObject = NO;
	
	for (int i = 0; i < [msg length]; i++) 
	{
		if (began == NO) 
		{
			if ([msg characterAtIndex:i] == '{')
				began = true;
		}
		else 
		{
			if (isKey == YES) 
			{
				if ([msg characterAtIndex:i] == ':')
					isKey = NO;
				else
					currentKey = [currentKey stringByAppendingFormat:@"%C", [msg characterAtIndex:i] ];
			}
			else 
			{
				if (numOfBrankets > 0) 
					currentValue = [currentValue stringByAppendingFormat:@"%C", [msg characterAtIndex:i] ];
				else if (numOfBrankets == 0 && [msg characterAtIndex:i] == '{')
					currentValue = [currentValue stringByAppendingFormat:@"%C", [msg characterAtIndex:i] ];
				else if ([msg characterAtIndex:i] == '['){
					isList = YES;
					currentList = [NSMutableArray arrayWithCapacity:16];
				}else if (isList && [msg characterAtIndex:i] == ']'){
					isList = NO;
                    [map setValue:currentList forKey: [self strip:currentKey]];
                    NSLog(@"%@ = List", currentKey);
                    currentKey = @"";
				}
				else if ([msg characterAtIndex:i] == ',' || (numOfBrankets == 0 && [msg characterAtIndex:i] == '}' ))
				{
					if (!isList){
						isKey = YES;
						if (hasObject){
                            [map setValue:[self parse:currentValue] forKey: [self strip:currentKey]];
                            NSLog(@"%@ = Object", currentKey);
                        }
						else 
							[map setValue:[self strip:currentValue] forKey: [self strip:currentKey]];
						currentKey = @"";
					}
					currentValue = @"";
					hasObject = NO;
				} 
				else
					currentValue = [currentValue stringByAppendingFormat:@"%C", [msg characterAtIndex:i]];
				
				if ([msg characterAtIndex:i] == '{')
					numOfBrankets++;
				else if ([msg characterAtIndex:i] == '}'){
					numOfBrankets--;
					if (isList){
						[currentList addObject:[self parse:currentValue]];
						currentValue = @"";
					}
				}				
				if (numOfBrankets > 0)
					hasObject = YES;
			}
		}
	}	
	return map;	
}

+ (NSString *)strip: (NSString *) val
{
	if (val == nil)
		return @"";
	val = [val stringByReplacingOccurrencesOfString:@"\"" withString:@""];
	NSString * strippedText = [val stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
	return strippedText;
}
	
@end