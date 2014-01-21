//
//  CardGamePlayingCard.m
//  CardGame
//
//  Created by artsy on 1/13/14.
//  Copyright (c) 2014 Laura. All rights reserved.
//

#import "CardGamePlayingCard.h"

@implementation CardGamePlayingCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    if ([otherCards count]){
        CardGamePlayingCard *otherCard = [otherCards firstObject];
        if (self.suit == otherCard.suit) {
            score = 1;
        } else if (self.rank == otherCard.rank) {
            score = 4;
        }
    }
    return score;
}
- (NSString *)contents
{
    NSArray *rankStrings = [CardGamePlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit; // because we provide setter AND getter

+ (NSArray *)validSuits
{
    return @[@"♥",@"♦",@"♠",@"♣"];
}

- (void)setSuit:(NSString *)suit
{
    if ([[CardGamePlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (NSString *)suit
{
    return _suit ? _suit : @"?";
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger)maxRank { return [[self rankStrings] count]-1; }

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [CardGamePlayingCard maxRank]) {
        _rank = rank;
    }
}

@end
