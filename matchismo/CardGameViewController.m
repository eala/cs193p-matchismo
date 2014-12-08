//
//  CardGameViewController.m
//  matchismo
//
//  Created by eala on 13/3/29.
//  Copyright (c) 2013�?eala. All rights reserved.
//

#import "CardGameViewController.h"


@interface CardGameViewController ()

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

//@property (strong, nonatomic) IBOutlet UISegmentedControl *gameModeControl;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *operationLabel;

@property (strong, nonatomic) NSMutableArray *history;
@end

@implementation CardGameViewController

-(Deck *)createDeck{
    return nil;
}

-(NSUInteger)getGameMode{
    return 0;
}

-(CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[self createDeck]];
        _game.gameMode = [self getGameMode];
    }
    return _game;
}

-(NSMutableArray *)history{
    if (!_history) {
        _history = [[NSMutableArray alloc]init];
    }
    return _history;
}

-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

-(NSString *)titleForCard: (Card *)card{
    return card.isChosen? card.contents: @"";
}

-(UIImage *)backgroundImageForCard: (Card *)card{
    return [UIImage imageNamed: card.isChosen? @"cardfront" : @"cardback"];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card* card=[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %ld", self.game.score];
    self.operationLabel.text = [NSString stringWithFormat:@"%@", self.game.flipResult];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    //self.gameModeControl.enabled = NO;
    [self.game chooseCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

- (IBAction)deal:(UIButton *)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning"
                                                    message:@"Are you sure you want to deal the game?"
                                                   delegate:self
                                          cancelButtonTitle:@"Cancel"
                                          otherButtonTitles:@"YES", nil];
    [alert show];
}

-(void)alertView: (UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (1 == buttonIndex) {
        self.game = nil;
        //self.gameModeControl.enabled = YES;
        [self updateUI];
    }
}

@end
