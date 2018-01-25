//
//  AnimationScene.h
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/25/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#ifndef AnimationScene_h
#define AnimationScene_h

@import SpriteKit;
#import "AnimationType.h"
#import "DesertCharacterOrientation.h"

@interface AnimationScene: SKScene

-(void)runAnimationWithAnimationType:(AnimationType)animationType andWithOrientation:(DesertCharacterOrientation)orientation;


@end

#endif /* AnimationScene_h */
