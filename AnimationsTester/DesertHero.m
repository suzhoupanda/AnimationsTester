//
//  DesertHero.m
//  Letter Mischief Madness
//
//  Created by Aleksander Makedonski on 1/25/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

#import "DesertHero.h"
#import "DesertHero+AnimationsGenerator.h"
#import "AnimationType.h"

@interface DesertHero()

@property SKSpriteNode* spriteNode;

@property DesertCharacterOrientation currentOrientation;
@property AnimationType currentAnimationType;

@end


@interface DesertHero()

/** Stored references to animations **/

@property SKAction* idleLeftAnimation;
@property SKAction* idleRightAnimation;

@property SKAction* runLeftAnimation;
@property SKAction* runRightAnimation;

@property SKAction* walkLeftAnimation;
@property SKAction* walkRightAnimation;

@property SKAction* jumpLeftAnimation;
@property SKAction* jumpRightAnimation;

@property SKAction* shootLeftAnimation;
@property SKAction* shootRightAnimation;

@property SKAction* climbAnimation;



@end



@implementation DesertHero

static NSString* const kDefaultTexture = @"IdleLeft_000";



-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        SKTexture* texture = [SKTexture textureWithImageNamed:kDefaultTexture];
        
        self.spriteNode = [SKSpriteNode spriteNodeWithTexture:texture];
        
        self.currentAnimationType = IDLE;
        self.currentOrientation = LEFT;
        
        [self configureSpriteNode];
        
        [self configureAnimations];
        
    }
    
    return self;
}


-(void)addDesertHeroTo:(SKScene*)scene atPosition:(CGPoint)position{
    
    [self.spriteNode moveToParent:scene];
    [self.spriteNode setPosition:position];
    
    
}



-(void)configureSpriteNode{
    
    NSLog(@"Configuring sprite node...");
    self.spriteNode.anchorPoint = CGPointMake(0.5, 0.5);
    self.spriteNode.xScale *= 0.25;
    self.spriteNode.yScale *= 0.25;
    
    
}



-(void)configureAnimations{
    
    NSLog(@"Configuring animations...");

    
    self.idleLeftAnimation = [self generateIdleAnimation:LEFT];
    self.idleRightAnimation = [self generateIdleAnimation:RIGHT];
    
    self.walkLeftAnimation = [self generateWalkAnimation:LEFT];
    self.walkRightAnimation = [self generateWalkAnimation:RIGHT];
    
    self.runLeftAnimation = [self generateRunAnimation:LEFT];
    self.runRightAnimation = [self generateRunAnimation:RIGHT];
    
    self.jumpLeftAnimation = [self generateJumpAnimation:LEFT];
    self.jumpRightAnimation = [self generateJumpAnimation:RIGHT];
    
    self.shootLeftAnimation = [self generateShootAnimation:LEFT];
    self.shootRightAnimation = [self generateShootAnimation:RIGHT];
    
    
}


-(void)runAnimationWithAnimationType:(AnimationType)animationType andWithOrientation:(DesertCharacterOrientation)orientation{
    
    [self runAnimationOnNode:self.spriteNode ForAnimationType:animationType andOrientation:orientation];
}



-(void)runAnimationOnNode:(SKSpriteNode*)node ForAnimationType:(AnimationType)animationType andOrientation:(DesertCharacterOrientation)orientation{
    
    
    SKAction* selectedAnimation = nil;
    
    switch (animationType) {
        case IDLE:
            if(orientation == LEFT){
                selectedAnimation = self.idleLeftAnimation;
            } else if(orientation == RIGHT){
                selectedAnimation = self.idleRightAnimation;
            } else {
                selectedAnimation = nil;
            }
            break;
        case WALK:
            if(orientation == LEFT){
                selectedAnimation = self.walkLeftAnimation;
            } else if(orientation == RIGHT){
                selectedAnimation = self.walkRightAnimation;
            } else {
                selectedAnimation = nil;
            }
            break;
        case RUN:
            if(orientation == LEFT){
                selectedAnimation = self.runLeftAnimation;
            } else if(orientation == RIGHT){
                selectedAnimation = self.runRightAnimation;
            } else {
                selectedAnimation = nil;
            }
            break;
        case SHOOT:
            if(orientation == LEFT){
                selectedAnimation = self.shootLeftAnimation;
            } else if(orientation == RIGHT){
                selectedAnimation = self.shootRightAnimation;
            } else {
                selectedAnimation = nil;
            }
            break;
        case JUMP:
            if(orientation == LEFT){
                selectedAnimation = self.jumpLeftAnimation;
            } else if(orientation == RIGHT){
                selectedAnimation = self.jumpRightAnimation;
            } else {
                selectedAnimation = nil;
            }
            break;
        default:
            break;
    }
    
    NSString* animationKey = [self generateAnimationKeyFor:animationType andFor:orientation];
    
    [node runAction:selectedAnimation withKey:animationKey];
}



@end



