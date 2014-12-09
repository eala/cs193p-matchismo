//
//  SetCard.m
//  matchismo
//
//  Created by Hank  on 2014/12/1.
//  Copyright (c) 2014年 eala. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard
@synthesize symbol = _symbol;
@synthesize shading = _shading;
@synthesize color = _color;

#pragma mark - SETTER & GETTER
#pragma mark - Card::contents
-(NSString *)contents
{
    NSMutableString *tempString = [[NSMutableString alloc] init];
    for (int i=0; i<self.rank; ++i) {
        [tempString appendString:self.symbol];
    }
    //return [NSString stringWithFormat:@"%@%@", [SetCard rankStrings][self.rank], self.symbol];
    // use NSAttributedString to represent shading & color
    return [tempString copy];
}

#pragma mark rank
+(NSUInteger)maxRank
{
    return [self rankStrings].count-1;
}

+(NSArray *)rankStrings
{
    return @[@"?", @"1", @"2", @"3"];
    
}

-(void)setRank:(NSInteger)rank
{
    if (rank <=  [SetCard maxRank]){
        _rank = rank;
    }
}

#pragma mark symbol
+ (NSArray *)validSymbol
{
    //return @[@"diamond", @"squiggle", @"oval"];
    return @[@"▲", @"◼︎", @"●"];
}

-(void)setSymbol:(NSString *)symbol
{
    if ([[SetCard validSymbol] containsObject:symbol]) {
        _symbol = symbol;
    }
}

-(NSString *)symbol
{
    return _symbol? _symbol: @"?";
}

#pragma mark shading
+ (NSArray *)validShading
{
    return @[@"solid", @"striped", @"open"];
}

-(void)setShading:(NSString *)shading
{
    if ([[SetCard validShading] containsObject:shading]) {
        _shading = shading;
    }
}

-(NSString *)shading
{
    return _shading? _shading: @"?";
}

#pragma mark color
+ (NSArray *)validColor
{
    return @[[UIColor redColor], [UIColor purpleColor], [UIColor greenColor]];
}

-(void)setColor:(UIColor *)color
{
    if ( [[SetCard validColor] containsObject:color]) {
        _color = color;
    }
}

-(UIColor *)color
{
    return _color? _color: [UIColor clearColor];
}

-(int)similarity:(SetCard *)anotherCard{
    int score = 0;
    const int SAME_RANK = 1;
    const int SAME_COLOR = 2;
    const int SAME_SADING = 4;
    const int SAME_SYMBOL = 8;
    if (self.rank == anotherCard.rank) score+= SAME_RANK;
    if ([self.color isEqual: anotherCard.color]) score+= SAME_COLOR;
    if ([self.shading isEqualToString: anotherCard.shading]) score+= SAME_SADING;
    if ([self.symbol isEqualToString: anotherCard.symbol]) score+= SAME_SYMBOL;
    return score;
}

-(int)match:(NSArray *)otherCards
{
    const int MATCHED_BONUS = 4;
    int score = 0;
    // directly consider 3 cards situation
    if (otherCards.count==2){
        SetCard *matchedCard = otherCards[0];
        SetCard *matchingCard = otherCards[1];
        if ([self similarity:matchedCard] == [self similarity:matchedCard]
            && [self similarity:matchedCard] == [matchedCard similarity:matchingCard]){
            score += MATCHED_BONUS;
        }
    }
    return score;
}
@end
