//
//  CardGameCard.m
//  CardGame
//
//  Created by artsy on 1/13/14.
//  Copyright (c) 2014 Laura. All rights reserved.
//

#import "CardGameCard.h"

@implementation CardGameCard

- (int)match:(NSArray *)otherCards
{
    int score = 0;
    
    for (CardGameCard *card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
