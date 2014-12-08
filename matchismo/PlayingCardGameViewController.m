//
//  PlayingCardGameViewController.m
//  matchismo
//
//  Created by Hank  on 2014/11/26.
//  Copyright (c) 2014年 eala. All rights reserved.
//

#import "PlayingCardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface PlayingCardGameViewController ()

@end

@implementation PlayingCardGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Deck *)createDeck
{
    //self.game.gameMode = 2;
    return [[PlayingCardDeck alloc] init];
}

-(NSUInteger)getGameMode{
    return 2;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
