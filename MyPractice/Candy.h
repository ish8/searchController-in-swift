//
//  Candy.h
//  MyPractice
//
//  Created by Ishani on 7/30/15.
//  Copyright (c) 2015 Ishani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Candy : NSObject
{
    
}

@property (nonatomic,strong) NSString *cName;
@property (nonatomic, strong) NSString *cCategory;

+(id)setCandyWith:(NSString*)candyName and:(NSString*)candyCategory;
@end
