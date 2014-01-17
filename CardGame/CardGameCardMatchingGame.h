//
//  CardGameCardMatchingGame.h
//  CardGame
//
//  Created by Laura Brown on 1/17/14.
//  Copyright (c) 2014 Laura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardGameDeck.h"
@interface CardGameCardMatchingGame : NSObject

// desiginated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(CardGameDeck *)deck;

- (void)chooseCardAtIndex:(NSUInteger)index;
- (CardGameCard* )cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) NSInteger score;

@end
