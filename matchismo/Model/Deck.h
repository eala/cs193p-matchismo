//
//  Deck.h
//  matchismo
//
//  Created by eala on 13/3/28.
//  Copyright (c) 2013年 eala. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard: (Card *)card atTop:(BOOL)atTop;
-(void) addCard: (Card *)card;

-(Card *)drawRandomCard;
-(NSInteger)cardCount;
@end
