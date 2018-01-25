//
//  AnimationScene.m
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/25/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AnimationScene.h"
#import "DesertHero.h"

@interface AnimationScene()

@property DesertHero* hero;

@end



@implementation AnimationScene


-(void)didMoveToView:(SKView *)view{
    
    self.anchorPoint = CGPointMake(0.5, 0.5);
    
    [self configureBackground];
    
    self.hero = [[DesertHero alloc] init];
    
    [self.hero addDesertHeroTo:self atPosition:CGPointZero];
    
}

-(void)configureBackground{
    

    SKSpriteNode* backgroundSprite = [SKSpriteNode spriteNodeWithImageNamed:@"desert_background"];
    
    backgroundSprite.anchorPoint = CGPointMake(0.5, 0.5);
    
    backgroundSprite.zPosition = -10;
    
    [backgroundSprite setScale:0.5];
    
    [backgroundSprite moveToParent:self];
}

-(void)runAnimationWithAnimationType:(AnimationType)animationType andWithOrientation:(DesertCharacterOrientation)orientation{
    
    [self.hero runAnimationWithAnimationType:animationType andWithOrientation:orientation];

    
}


@end
