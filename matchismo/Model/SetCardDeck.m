//
//  SetCardDeck.m
//  matchismo
//
//  Created by Hank  on 2014/12/2.
//  Copyright (c) 2014年 eala. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

#if 1
-(instancetype)init
{
    self = [super init];
    if (self) {
        for (NSUInteger rank=1; rank <= [SetCard maxRank]; ++rank) {
            for (NSString *symbol in [SetCard validSymbol]) {
                for (NSString *shading in [SetCard validShading]) {
                    for (UIColor *color in [SetCard validColor]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.rank = rank;
                        card.symbol = symbol;
                        card.shading = shading;
                        card.color = color;
                        [self addCard:card];
                    }
                }
            }
        }
    }
    return self;
}

#else
// basic pattern
-(instancetype)init
{
    self = [super init];
    if (self) {
        ...
    }
    return self;
}
#endif


@end