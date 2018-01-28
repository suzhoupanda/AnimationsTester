//
//  DesertHero+AnimationsGenerator.m
//  Letter Mischief Madness
//
//  Created by Aleksander Makedonski on 1/25/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#import "DesertHero+AnimationsGenerator.h"
#import "TextureManager.h"


@interface DesertHero()


@property (readonly) TextureManager* sharedManager;

@end


@implementation DesertHero (AnimationsGenerator)


const static double kIdleActionDuration = 0.40;
const static double kRunActionDuration = 0.30;
const static double kShootActionDuration = 0.30;
const static double kJumpActionDuration = 0.20;
const static double kWalkActionDuration = 0.30;



-(NSString*)generateAnimationKeyFor:(AnimationType)animationType andFor:(DesertCharacterOrientation)orientation{
    
    NSString* baseStr = [[NSString alloc] init];
    
    switch (animationType) {
        case IDLE:
            baseStr = @"idle";
            break;
        case WALK:
            baseStr = @"walk";
            break;
        case RUN:
            baseStr = @"run";
            break;
        case SHOOT:
            baseStr = @"shoot";
            break;
        case JUMP:
            baseStr = @"jump";
            break;
        default:
            break;
    }
    
    NSString* orientationStr;
    
    switch (orientation) {
        case LEFT:
            orientationStr = @"Left";
            break;
        case RIGHT:
            orientationStr = @"Right";
            break;
        case SYMMETRICAL:
            orientationStr = @"Symmetric";
            break;
        default:
            break;
    }
    
    
    return [baseStr stringByAppendingString:orientationStr];
    
}

-(SKAction *)generateIdleAnimation:(DesertCharacterOrientation)orientation{
    
    SKAction* idleAction;
    
    switch (orientation) {
        case LEFT:
            idleAction = [SKAction animateWithTextures:@[
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_000"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_001"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_002"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_003"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_004"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_005"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_006"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_007"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_008"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleLeft_009"],

             ] timePerFrame:kIdleActionDuration];
            break;
        case RIGHT:
            idleAction = [SKAction animateWithTextures:@[
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_000"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_001"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_002"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_003"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_004"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_005"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_006"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_007"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_008"],
             [[self.sharedManager idleTextureAtlas] textureNamed:@"IdleRight_009"],

                 ] timePerFrame:kIdleActionDuration];
            break;
        case SYMMETRICAL:
            break;
        default:
            break;
    }
    
    SKAction* idleAnimation = [SKAction repeatActionForever:idleAction];
    
    return idleAnimation;
    
}


-(SKAction *)generateRunAnimation:(DesertCharacterOrientation)orientation{
    
    SKAction*(^getRunAnimation)(DesertCharacterOrientation) = [self getAnimationGeneratorWithLeftOrientationTextures:@[
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_000"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_001"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_002"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_003"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_004"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_005"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_006"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_007"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_008"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunLeft_009"],

       ]
      
      andWithRightOrientationTexture:@[
      
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_000"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_001"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_002"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_003"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_004"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_005"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_006"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_007"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_008"],
           [[self.sharedManager runTextureAtlas] textureNamed:@"RunRight_009"],



      ] andWithSymmetricOrientationTextures: nil
     andWithTimePerFrame:kRunActionDuration];
    
    return getRunAnimation(orientation);
    
}

-(SKAction *)generateJumpAnimation:(DesertCharacterOrientation)orientation{
    
    SKAction*(^getJumpAnimation)(DesertCharacterOrientation) = [self getAnimationGeneratorWithLeftOrientationTextures:@[
        
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_000"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_001"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_002"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_003"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_004"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_005"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_006"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_007"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_008"],
    [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpLeft_009"],

        ] andWithRightOrientationTexture:@[
       
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_000"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_001"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_002"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_003"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_004"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_005"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_006"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_007"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_008"],
   [[self.sharedManager jumpTextureAtlas] textureNamed:@"JumpRight_009"],
       ] andWithSymmetricOrientationTextures:nil andWithTimePerFrame:kJumpActionDuration];
    
    return getJumpAnimation(orientation);
}



-(SKAction *)generateShootAnimation:(DesertCharacterOrientation)orientation{
    
    SKAction*(^getShootAnimation)(DesertCharacterOrientation) = [self getAnimationGeneratorWithLeftOrientationTextures:
  @[
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_000"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_001"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_002"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_003"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_004"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_005"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_006"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_007"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_008"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootLeft_009"],

    ]
    andWithRightOrientationTexture:
  @[
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_000"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_001"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_002"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_003"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_004"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_005"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_006"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_007"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_008"],
    [[self.sharedManager shootTextureAtlas] textureNamed:@"ShootRight_009"],



    ]
   andWithSymmetricOrientationTextures:nil
   andWithTimePerFrame:kShootActionDuration];
    
    return getShootAnimation(orientation);
    
}



-(SKAction *)generateWalkAnimation:(DesertCharacterOrientation)orientation{
    
    SKAction*(^getWalkAnimation)(DesertCharacterOrientation) = [self getAnimationGeneratorWithLeftOrientationTextures:
  @[
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_000"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_001"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_002"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_003"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_004"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_005"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_006"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_007"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_008"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkLeft_009"],


    ]
   andWithRightOrientationTexture:
  @[
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_000"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_001"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_002"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_003"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_004"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_005"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_006"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_007"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_008"],
    [[self.sharedManager walkTextureAtlas] textureNamed:@"WalkRight_009"]

    ]
                                                                
  andWithSymmetricOrientationTextures:nil andWithTimePerFrame:kWalkActionDuration];
    
    return getWalkAnimation(orientation);
    
};

-(SKAction*(^)(DesertCharacterOrientation))getAnimationGeneratorWithLeftOrientationTextures:(NSArray<SKTexture*>*)leftOrientationTextures andWithRightOrientationTexture:(NSArray<SKTexture*>*)rightOrientationTextures andWithSymmetricOrientationTextures:(NSArray<SKTexture*>*)symmetricOrientationTextures andWithTimePerFrame:(NSTimeInterval)timePerFrame{
    
    return ^(DesertCharacterOrientation orientation){
        
        SKAction* baseAction;
        
        switch (orientation) {
            case LEFT:
                baseAction =  [SKAction animateWithTextures:leftOrientationTextures timePerFrame:timePerFrame];
                break;
            case RIGHT:
                baseAction =  [SKAction animateWithTextures:rightOrientationTextures timePerFrame:timePerFrame];
                break;
            case SYMMETRICAL:
                baseAction =  [SKAction animateWithTextures:symmetricOrientationTextures timePerFrame:timePerFrame];
                break;
            default:
                break;
        }
        
        SKAction* repeatingAnimation = [SKAction repeatActionForever:baseAction];
        
        return repeatingAnimation;
        
        
    };
}


-(TextureManager *)sharedManager{
    
    return [TextureManager sharedManager];
}


@end
