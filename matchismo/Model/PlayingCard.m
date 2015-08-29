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

#pragma mark - utilties
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

#pragma mark - setters & getters
-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

-(void)setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
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

#pragma mark - functions
const int SAME_SUIT_BONUS = 1;
const int SAME_RANK_BONUS = 4;
const int NOT_MATCH_PENALTY = -2;
-(int)match:(NSArray *)otherCards
{
    int score = 0;
    if ( 1 == otherCards.count) {
        PlayingCard *otherCard = [otherCards firstObject];
        if ([otherCard.suit isEqualToString:self.suit])
            score += SAME_SUIT_BONUS;
            
        if (otherCard.rank == self.rank)
            score += SAME_RANK_BONUS;
        
        if (score > 0){
            self.operation = [NSString stringWithFormat:@"Matched %@ %@ for %d", otherCard.contents, self.contents, score];
        }else{
            score += NOT_MATCH_PENALTY;
            self.operation = [NSString stringWithFormat:@"%@ %@don't match!2 point penality ", otherCard.contents, self.contents];
        }
    }else{
        int tempScore = 0;
        for (size_t i=0; i< otherCards.count-1; ++i) {
            PlayingCard *matchedCard = otherCards[i];
            tempScore = [self match:@[matchedCard]];
            if (tempScore > 0) {
                self.operation = [NSString stringWithFormat:@"Matched %@ %@ for %d", matchedCard.contents, self.contents, tempScore];
                score += tempScore;
            }
            
            for (size_t j=i+1; j< otherCards.count; ++j) {
                PlayingCard *matchingCard = otherCards[j];
                tempScore = [matchedCard match:@[matchingCard]];
                if (tempScore > 0) {
                    self.operation = [NSString stringWithFormat:@"Matched %@ %@ for %d", matchedCard.contents, matchingCard.contents, tempScore];
                    score += tempScore;
                }
            }
        }
        
        tempScore = [self match:@[otherCards[otherCards.count-1]]];
        if (tempScore > 0) {
            self.operation = [NSString stringWithFormat:@"Matched %@ %@ for %d", self.contents, [otherCards[otherCards.count-1] contents], tempScore];
            score += tempScore;
        }
        
        // missing one in i to otherCards.count-1
        if (score < 0) {
            for (PlayingCard *otherCard in otherCards)
            {
                self.operation = [NSString stringWithFormat:@"%@, %@", self.operation, otherCard.contents];
            }
            self.operation = [NSString stringWithFormat:@"%@, %@ don't match", self.operation, self.contents];
        }
    }
    return score;
}

@end
