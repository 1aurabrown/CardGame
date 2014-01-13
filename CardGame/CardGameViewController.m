//
//  CardGameViewController.m
//  CardGame
//
//  Created by artsy on 1/13/14.
//  Copyright (c) 2014 Laura. All rights reserved.
//

#import "CardGameViewController.h"
#import "CardGamePlayingCardDeck.h"

@interface CardGameViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) CardGameDeck *deck;
@end

@implementation CardGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

- (CardGameDeck *)deck
{
    if (!_deck) _deck = [[CardGamePlayingCardDeck alloc] init];
    return _deck;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if ([sender.currentTitle length]){
    
        [sender setBackgroundImage:[UIImage imageNamed:@"card_back"]
                                              forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        
    } else {
        
        [sender setBackgroundImage:[UIImage imageNamed:@"card_front"]
                          forState:UIControlStateNormal];
        CardGameCard *randomCard = [self.deck drawRandomCard];
        
        if (randomCard) {
            
            [sender setTitle:randomCard.contents forState:UIControlStateNormal];
            self.flipCount++;
            
        } else {
            
            sender.titleLabel.font = [UIFont systemFontOfSize:11];
            [sender setTitle: @"Empty!" forState:UIControlStateNormal];
        }
    }
}

@end
