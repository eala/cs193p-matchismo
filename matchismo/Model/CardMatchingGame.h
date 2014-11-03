//
//  CardMatchingGame.h
//  matchismo
//
//  Created by Hank  on 13/4/1.
//  Copyright (c) 2013年 eala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject

-(id) initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck;


-(void) flipCardAtIndex:(NSUInteger)index;

-(Card *) cardAtIndex: (NSUInteger)index;

@property (nonatomic) bool bStartFliped;
@property (nonatomic, readonly) int score;
@property (nonatomic, readonly, strong) NSString *flipResult;
@property (nonatomic, readonly) int nFlipCount;
@property (nonatomic) NSInteger nGameMode;	// fixme later, use other type, like dictionary to switch the modes, 0 as the default 2-card-match
@end
