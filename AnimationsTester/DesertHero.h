//
//  DesertHero.h
//  Letter Mischief Madness
//
//  Created by Aleksander Makedonski on 1/25/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#ifndef DesertHero_h
#define DesertHero_h

@import SpriteKit;
#import "AnimationType.h"
#import "DesertCharacterOrientation.h"

@interface DesertHero: NSObject

-(instancetype)init;

-(void)addDesertHeroTo:(SKScene*)scene atPosition:(CGPoint)position;

-(void)runAnimationWithAnimationType:(AnimationType)animationType andWithOrientation:(DesertCharacterOrientation)orientation;

@end

#endif /* DesertHero_h */
