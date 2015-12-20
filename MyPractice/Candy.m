//
//  Candy.m
//  MyPractice
//
//  Created by Ishani on 7/30/15.
//  Copyright (c) 2015 Ishani. All rights reserved.
//

#import "Candy.h"

@implementation Candy

@synthesize cName,cCategory;

+(id)setCandyWith:(NSString*)candyName and:(NSString*)candyCategory
{
    Candy *candyInstance = [[Candy alloc]init];
    candyInstance.cName = candyName;
    candyInstance.cCategory = candyCategory;
    
    return candyInstance;
}

@end
