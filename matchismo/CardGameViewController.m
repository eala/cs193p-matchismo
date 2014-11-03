//
//  CardGameViewController.m
//  matchismo
//
//  Created by eala on 13/3/29.
//  Copyright (c) 2013å¹?eala. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (strong, nonatomic) CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameModeControl;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *operationLabel;
@end

@implementation CardGameViewController

- (IBAction)changeMode:(id)sender {
	self.game.nGameMode = self.gameModeControl.selectedSegmentIndex;
}

-(CardMatchingGame *)game
{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[[PlayingCardDeck alloc]init]];
    }
    return _game;
}

-(void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        Card* card=[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        
        cardButton.selected = card.isFaceUp;
        if (!cardButton.selected) {
            [cardButton setTitle:@"" forState:UIControlStateNormal];
            [cardButton setBackgroundImage:[UIImage imageNamed:@"cardBack.jpg"] forState:UIControlStateNormal];
        }else{
            [cardButton setTitle:card.contents forState:UIControlStateNormal];
            [cardButton setBackgroundImage:nil forState:UIControlStateNormal];
        }
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.operationLabel.text = [NSString stringWithString:self.game.flipResult];
    self.gameModeControl.hidden = self.game.bStartFliped;
    self.flipsLabel.text = [NSString stringWithFormat:@"%d",self.game.nFlipCount];
}

- (IBAction)flipCard:(UIButton *)sender {
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    [self updateUI];
}

- (IBAction)deal:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}

@end
