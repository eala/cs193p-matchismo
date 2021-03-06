//
//  CardMatchingGame.h
//  matchismo
//
//  Created by Hank  on 13/4/1.
//  Copyright (c) 2013年 eala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

-(instancetype) initWithCardCount:(NSUInteger)cardCount
                        usingDeck:(Deck *)deck;
-(void) chooseCardAtIndex:(NSUInteger)index;
-(Card *) cardAtIndex: (NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;
@property (nonatomic) bool bStartFliped;
@property (nonatomic, readonly, strong) NSString *flipResult;
@property (nonatomic, readonly) int nFlipCount;
@property (nonatomic) NSInteger gameMode;
@property (strong, nonatomic) NSMutableArray *history;

@end
