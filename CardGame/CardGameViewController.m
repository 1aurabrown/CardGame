//
//  CardGameViewController.m
//  CardGame
//
//  Created by artsy on 1/13/14.
//  Copyright (c) 2014 Laura. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardGamePlayingCardDeck.h"
#import "CardGameCardMatchingGame.h"

@interface CardGameViewController ()
@property (nonatomic, strong) CardGameDeck *deck;
@property (nonatomic, strong) CardGameCardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation CardGameViewController

- (CardGameCardMatchingGame *) game
{
    if (!_game) _game = [[CardGameCardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

- (CardGameDeck *)createDeck
{
    return [[CardGamePlayingCardDeck alloc] init];
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

- (IBAction)resetGame:(UIButton *)sender {
    self.game = nil;
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        CardGameCard *card = [self.game cardAtIndex:cardIndex];
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
}

- (NSString *)titleForCard:(CardGameCard *)card
{
    return card.isChosen ? card.contents : @"";
}

- (UIImage *)backgroundImageForCard:(CardGameCard *)card
{
    return [UIImage imageNamed:card.isChosen ? @"card_front" : @"card_back"];
}

@end
