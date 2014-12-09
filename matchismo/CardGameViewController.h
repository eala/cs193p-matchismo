//
//  CardGameViewController.h
//  matchismo
//
//  Created by eala on 13/3/29.
//  Copyright (c) 2013年 eala. All rights reserved.
//
//  This is an abstract card game viewController

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController : UIViewController

@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

// public API
-(Deck *)createDeck;
-(NSUInteger)getGameMode;
-(void)drawCardButtonByCard: (Card *)card
                       over: (UIButton *)button;

// protected
-(NSString *)titleForCard: (Card *)card;
@end
