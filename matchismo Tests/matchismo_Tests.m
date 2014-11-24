//
//  matchismo_Tests.m
//  matchismo Tests
//
//  Created by Hank  on 2014/11/24.
//  Copyright (c) 2014年 eala. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "Deck.h"

@interface matchismo_Tests : XCTestCase

@end

@implementation matchismo_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

-(void)testDrawSingleCard{
    Card *firstCard = [[Card alloc] init];
    firstCard.contents = @"9♣︎";
    
    Deck *deck = [[Deck alloc]init];
    [deck addCard:firstCard];
    
    Card *drawCard = [deck drawRandomCard];
    XCTAssertEqualObjects(firstCard.contents, drawCard.contents, @"Only 1 card in deck, draw failed");
}

-(void)testDrawCardCountDownDeck{
    Card *firstCard = [[Card alloc] init];
    firstCard.contents = @"9♣︎";
    
    Deck *deck = [[Deck alloc]init];
    [deck addCard:firstCard];
    
    NSInteger initCardCount = [deck cardCount];
    [deck drawRandomCard];
    NSInteger cardCountAfterDraw = [deck cardCount];
    XCTAssertEqual(initCardCount, cardCountAfterDraw+1, @"Card count should minus 1 after drawing");
}

@end
