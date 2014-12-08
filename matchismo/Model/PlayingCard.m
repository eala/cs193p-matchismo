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

#pragma mark - SETTERS & GETTERS
-(NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

#pragma mark suit
+ (NSArray *)validSuits
{
    return @[@"♥", @"♦", @"♠", @"♣"];
}

-(void)setSuit:(NSString *)suit
{
    if ([ [PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

// important initialization, you can return init value here
-(NSString *)suit
{
    return _suit ? _suit : @"?";
}

#pragma mark rank
+(NSArray *)rankStrings
{
    return @[@"?", @"A", @"2", @"3",@"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+(NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

-(void)setRank:(NSUInteger)rank
{
    // you could not use self since maxRank is static function
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
            self.lastMatchedResult = [[NSString alloc] initWithString: [NSString stringWithFormat:@"Matched %@ %@ for %d", otherCard.contents, self.contents, score]];
        }else if (otherCard.rank == self.rank) {
            score =4;
            self.lastMatchedResult = [[NSString alloc] initWithString: [NSString stringWithFormat:@"Matched %@ %@ for %d", otherCard.contents, self.contents, score]];
        }else{
            self.lastMatchedResult = [[NSString alloc] initWithString: [NSString stringWithFormat:@"%@ %@don't match!2 point penality ", otherCard.contents, self.contents]];
        }
    }else{
        int tempScore = 0;
        for (size_t i=0; i< otherCards.count-1; ++i) {
            PlayingCard *matchedCard = otherCards[i];
            tempScore = [self match:@[matchedCard]];
            if (tempScore > 0) {
                self.lastMatchedResult = [NSString stringWithFormat:@"Matched %@ %@ for %d", matchedCard.contents, self.contents, tempScore];
                score += tempScore;
            }
            
            for (size_t j=i+1; j< otherCards.count; ++j) {
                PlayingCard *matchingCard = otherCards[j];
                tempScore = [matchedCard match:@[matchingCard]];
                if (tempScore > 0) {
                    self.lastMatchedResult = [NSString stringWithFormat:@"Matched %@ %@ for %d", matchedCard.contents, matchingCard.contents, tempScore];
                    score += tempScore;
                }
            }
        }
        
        tempScore = [self match:@[otherCards[otherCards.count-1]]];
        if (tempScore > 0) {
            self.lastMatchedResult = [NSString stringWithFormat:@"Matched %@ %@ for %d", self.contents, [otherCards[otherCards.count-1] contents], tempScore];
            score += tempScore;
        }
        
        // missing one in i to otherCards.count-1
        if (score < 0) {
            for (PlayingCard *otherCard in otherCards)
            {
                self.lastMatchedResult = [NSString stringWithFormat:@"%@, %@", self.lastMatchedResult, otherCard.contents];
            }
            self.lastMatchedResult = [NSString stringWithFormat:@"%@, %@ don't match", self.lastMatchedResult, self.contents];
        }
    }
    return score;
}

@end
