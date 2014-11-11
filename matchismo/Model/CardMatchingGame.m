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
@property (strong, nonatomic) NSMutableArray *chosenCards;

@property (nonatomic) int nFlipCount;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

-(NSMutableArray *)chosenCards{
    if (!_chosenCards) {
        _chosenCards = [[NSMutableArray alloc] init];
    }
    return _chosenCards;
}

-(NSString *)flipResult
{
    if (!_flipResult) {
        _flipResult = [[NSString alloc] init];
    }
    return _flipResult;
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
    Card* card = [self cardAtIndex:index];
    
    if (!card.isMatched) {
        if (card.isChosen) { // re-select
            card.chosen = NO;
            [self.chosenCards removeObject:card];
        }else{
            if ( self.gameMode == self.chosenCards.count){
                // it means that this card is the last matching one
                int matchedScore = [card match: self.chosenCards];
                if (matchedScore > 0) {
                    self.score +=  matchedScore * MATCH_BOUNS;
                    for (Card *otherCard in self.chosenCards){
                        otherCard.matched = YES;
                        card.matched = YES;
                        otherCard.chosen = YES;  // in fact, it should have been done
                    }
                    [self.chosenCards removeAllObjects];
                }else{
                    // reset chosen cards
                    for (Card *otherCard in self.chosenCards){
                        otherCard.chosen = NO;
                    }
                    [self.chosenCards removeAllObjects];
                    self.score -= MISMATCH_PENALITY;
                    
                    [self.chosenCards addObject:card];
                }
                card.chosen = YES;
            }else{
                // general case, not arrive checking point
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
                [self.chosenCards addObject:card];
            }
        }
    }
}
@end
