//
//  AnimationsController.m
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/25/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "AnimationsController.h"
#import "AnimationScene.h"
#import "AnimationType.h"
#import "DesertCharacterOrientation.h"
#import "TextureManager.h"


@interface AnimationsController()

@property (weak, nonatomic) IBOutlet SKView *skView;

@property AnimationScene* animationScene;
@property DesertCharacterOrientation currentOrientation;
@property AnimationType currentAnimationType;

@property (weak, nonatomic) IBOutlet UISegmentedControl *orientationSegmentedControl;



@end


@implementation AnimationsController

-(void)viewDidLoad{
    
    
    
    CGSize size = self.skView.bounds.size;
    
    self.animationScene = [[AnimationScene alloc] initWithSize:size];
    
    [self.skView presentScene:self.animationScene];
    
    
  

}

- (IBAction)changeOrientation:(UISegmentedControl *)sender {
    
    self.currentOrientation = (DesertCharacterOrientation)self.orientationSegmentedControl.selectedSegmentIndex;
    
    [self runAnimation];

}



- (IBAction)showIdleAnimation:(UIButton *)sender {
    
    self.currentAnimationType = IDLE;

    [self runAnimation];
}

- (IBAction)showWalkAnimation:(UIButton *)sender {
    
    self.currentAnimationType = WALK;

    [self runAnimation];

}


- (IBAction)showRunAnimation:(UIButton *)sender {
    
    self.currentAnimationType = RUN;

    [self runAnimation];

}

- (IBAction)showJumpAnimation:(UIButton *)sender {
    
    self.currentAnimationType = JUMP;

    [self runAnimation];

}
- (IBAction)showShootAnimation:(UIButton *)sender {
    
    self.currentAnimationType = SHOOT;

    [self runAnimation];

}


-(void)runAnimation{
    
    [self.animationScene runAnimationWithAnimationType:self.currentAnimationType andWithOrientation:self.currentOrientation];
}







@end
