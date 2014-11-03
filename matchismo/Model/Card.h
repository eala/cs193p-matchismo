//
//  Card.h
//  matchismo
//
//  Created by eala on 13/3/28.
//  Copyright (c) 2013年 eala. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;

@property (nonatomic, getter = isFaceUp) BOOL faceUp;
@property (nonatomic, getter = isUnplayable) BOOL unplayable;

-(int) match: (NSArray *)otherCards;
@end
