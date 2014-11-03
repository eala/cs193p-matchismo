//
//  PlayingCard.h
//  matchismo
//
//  Created by eala on 13/3/28.
//  Copyright (c) 2013年 eala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
