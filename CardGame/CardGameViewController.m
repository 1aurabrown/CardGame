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
@end

@implementation CardGameViewController

- (CardGameCardMatchingGame *) game
{
    if (!_game) _game = [[CardGameCardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
    return _game;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}



- (CardGameDeck *)createDeck
{
    return [[CardGamePlayingCardDeck alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchCardButton:(UIButton *)sender {
    int cardIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardIndex];
    [self updateUI];
}

-(void)updateUI
{
    for (UIButton *cardButton in self.cardButtons) {
        int cardIndex = [self.cardButtons indexOfObject:cardButton];
        CardGameCard *card = [self.game cardAtIndex:cardIndex];
        NSLog(@"%@", [self backgroundImageForCard:card]);
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
    }
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
