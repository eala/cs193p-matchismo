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

// public API
-(Deck *)createDeck;
-(NSUInteger)getGameMode;

// protected
@end
