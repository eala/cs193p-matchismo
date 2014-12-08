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
    NSArray *numberString = [SetCard rankStrings];
    return [NSString stringWithFormat:@"%@_%@_%@_%@", numberString[self.rank], self.symbol, self.shading, self.color];
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
    return @[@"diamond", @"squiggle", @"oval"];
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
    return @[@"red", @"green", @"purple"];
}

-(void)setColor:(NSString *)color
{
    if ( [[SetCard validColor] containsObject:color]) {
        _color = color;
    }
}

-(NSString *)color
{
    return _color? _color: @"?";
}


@end
