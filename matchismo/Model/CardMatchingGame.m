//
//  CardMatchingGame.m
//  matchismo
//
//  Created by Hank  on 13/4/1.
//  Copyright (c) 2013年 eala. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCard.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) NSString *flipResult;
@property (nonatomic) int score;
@property (nonatomic) int nFlipCount;
@end

@implementation CardMatchingGame

-(NSString *)flipResult
{
    if (!_flipResult) {
        _flipResult = [[NSString alloc] init];
    }
    return _flipResult;
}

-(void)setNGameMode:(NSInteger)nGameMode
{
	_nGameMode = nGameMode;
    //NSLog(@"Current Game Mode:%d\n", self.nGameMode);
}

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(id) initWithCardCount:(NSUInteger)cardCount usingDeck:(Deck *)deck
{
    self.nFlipCount=0;
    self = [super init];
    if (self) {
        for (int i=0; i<cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                return nil;
            }else{
                self.cards[i] = card;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return  (index < self.cards.count) ? self.cards[index] : nil;
}

#define MATCHED_BONUS 4
#define MISS_MATCHED_PENALTY 2
#define FLIP_COST 1

-(void)flipCardAtIndex:(NSUInteger)index
{
    self.nFlipCount++;
    self.bStartFliped = YES;
    Card* card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if (!card.isFaceUp) {
            self.flipResult = [NSString stringWithFormat:@"Fliped Up %@", card.contents];
            for (Card *otherCards in self.cards) {
                if (otherCards.isFaceUp && !otherCards.isUnplayable) {
                    int matchedScore = [card match: @[otherCards]];
                    if (matchedScore) {
                        card.unplayable = YES;
                        otherCards.unplayable = YES;
                        self.score += MATCHED_BONUS * matchedScore;
                        self.flipResult = [NSString stringWithFormat:@"Matched %@ & %@ for 4 points", card.contents, otherCards.contents];
                    }else{
                        otherCards.faceUp = NO;
                        self.score -= MISS_MATCHED_PENALTY;
                        self.flipResult = [NSString stringWithFormat:@"%@ & %@ don't match! 2 point penality!", card.contents, otherCards.contents];
                    }
                }
            }
            self.score -= FLIP_COST;
        }
        card.faceUp = !card.isFaceUp;
    }
}
@end
