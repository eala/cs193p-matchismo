//
//  SetCard.h
//  matchismo
//
//  Created by Hank  on 2014/12/1.
//  Copyright (c) 2014年 eala. All rights reserved.
//
// Ref: http://en.wikipedia.org/wiki/Set_(game)
// 4 features:
//      number: 1-3
//      symbol: diamond, squiggle, oval
//      shading: solid, striped, open
//      color: red, green, purple
// total 81 cards in a deck

#import "Card.h"

@interface SetCard : Card

@property (nonatomic) NSInteger rank;
@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *shading;
//@property (nonatomic, strong) NSString *color;
@property (nonatomic, strong) UIColor *color;

+(NSUInteger)maxRank;
+ (NSArray *)validSymbol;
+ (NSArray *)validShading;
//+ (NSArray *)validColor;
+ (NSArray *)validColor;
@end
