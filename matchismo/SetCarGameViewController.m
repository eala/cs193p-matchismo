//
//  SetCarGameViewController.m
//  matchismo
//
//  Created by Hank  on 2014/11/26.
//  Copyright (c) 2014年 eala. All rights reserved.
//

#import "SetCarGameViewController.h"
#import "SetCardDeck.h"
#import "SetCard.h"

@interface SetCarGameViewController ()

@end

@implementation SetCarGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Deck *)createDeck{
    return [[SetCardDeck alloc] init];
}

-(NSUInteger)getGameMode{
    return 2;
}

-(void)drawCardButtonByCard: (SetCard *)card
                       over: (UIButton *)button
{
    [button setTitle:@"" forState:UIControlStateNormal];
    
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc]initWithString: [self titleForCard:card] attributes:
                @{NSForegroundColorAttributeName: card.color, 
                  //NSStrokeWidthAttributeName: [NSNumber numberWithFloat:3.0],
                  NSStrokeWidthAttributeName: [NSNumber numberWithFloat:-3.0],
                  NSStrokeColorAttributeName:[UIColor blueColor]}];

    [button setAttributedTitle:attributedStr forState:UIControlStateNormal];
    
    if ([[UIColor purpleColor] isEqual:[UIColor purpleColor]]){
        NSLog(@"purpleColor == purple color");
    }else{
        NSLog(@"purpleColor != purple color");
    }
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
