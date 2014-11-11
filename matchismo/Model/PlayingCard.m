//
//  PlayingCard.m
//  matchismo
//
//  Created by eala on 13/3/28.
//  Copyright (c) 2013年 eala. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit = _suit;

-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

+ (NSArray *)validSuits
{
    return @[@"♥", @"♦", @"♠", @"♣"];
}

+(NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3",@"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

-(void)setSuit:(NSString *)suit
{
   // _suit = suit;
    if ([ [PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

-(void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

-(int)match:(NSArray *)otherCards
{
    int score = 0;
    if (otherCards.count==1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        }else if (otherCard.rank == self.rank) {
            score =4;
        }
    }else{
        for (size_t i=0; i< otherCards.count-1; ++i) {
            PlayingCard *matchedCard = otherCards[i];
            score += [self match:@[matchedCard]];
            for (size_t j=i+1; j< otherCards.count; ++j) {
                PlayingCard *matchingCard = otherCards[j];
                score += [matchedCard match:@[matchingCard]];
            }
        }
        score += [self match:@[otherCards[otherCards.count-1]]];
        // missing one in i to otherCards.count-1
    }
    return score;
}

@end
