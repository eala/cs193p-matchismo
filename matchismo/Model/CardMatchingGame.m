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
@property (nonatomic, readwrite) NSInteger score;
@property (strong, nonatomic) NSMutableArray *cards;    // Of Cards
@property (strong, nonatomic) NSString *flipResult;

@property (nonatomic) int nFlipCount;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

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


-(instancetype) initWithCardCount:(NSUInteger)count
                        usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int i=0; i<count; i++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return  (index < self.cards.count) ? self.cards[index] : nil;
}

static const int MISMATCH_PENALITY = 2;
static const int MATCH_BOUNS = 4;
static const int COST_TO_CHOOSE = 1;

-(void)chooseCardAtIndex:(NSUInteger)index
{
    // it will be a problem when there are no cards to draw
    //self.nFlipCount++;
    Card* card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }else{
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchedScore = [card match: @[otherCard]];
                    if (matchedScore) {
                        self.score +=  matchedScore * MATCH_BOUNS;
                        otherCard.matched = YES;
                        card.matched = YES;
                        self.flipResult = [NSString stringWithFormat:@"Matched %@ & %@ for 4 points", card.contents, otherCard.contents];
                    }else{
                        otherCard.chosen = NO;
                        self.score -= MISMATCH_PENALITY;
                        self.flipResult = [NSString stringWithFormat:@"%@ & %@ don't match! 2 point penality!", card.contents, otherCard.contents];
                    }
                    break;
                }
            }
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
