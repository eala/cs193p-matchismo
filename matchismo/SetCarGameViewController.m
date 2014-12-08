//
//  SetCarGameViewController.m
//  matchismo
//
//  Created by Hank  on 2014/11/26.
//  Copyright (c) 2014年 eala. All rights reserved.
//

#import "SetCarGameViewController.h"
#import "SetCardDeck.h"

@interface SetCarGameViewController ()

@end

@implementation SetCarGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    return 3;
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
