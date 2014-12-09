//
//  HistoryTableViewController.h
//  matchismo
//
//  Created by Hank  on 2014/12/9.
//  Copyright (c) 2014年 eala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CardMatchingGame.h"

@interface HistoryTableViewController : UITableViewController
@property(strong, nonatomic) CardMatchingGame *game;
@end
