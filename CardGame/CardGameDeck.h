//
//  CardGameDeck.h
//  CardGame
//
//  Created by artsy on 1/13/14.
//  Copyright (c) 2014 Laura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CardGameCard.h"

@interface CardGameDeck : NSObject

- (void)addCard:(CardGameCard *)card atTop:(BOOL)atTop;
- (void)addCard:(CardGameCard *)card;

- (CardGameCard *)drawRandomCard;

@end
