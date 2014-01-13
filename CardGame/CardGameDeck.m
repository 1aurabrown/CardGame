//
//  CardGameDeck.m
//  CardGame
//
//  Created by artsy on 1/13/14.
//  Copyright (c) 2014 Laura. All rights reserved.
//

#import "CardGameDeck.h"


@interface CardGameDeck()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation CardGameDeck
- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (void)addCard:(CardGameCard *)card atTop:(BOOL)atTop
{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}

- (void)addCard:(CardGameCard *)card
{
    [self addCard:card atTop:NO];
}

- (CardGameCard *)drawRandomCard
{
    CardGameCard *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}
@end