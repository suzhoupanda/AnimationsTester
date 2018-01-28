//
//  DownloadableAnimation.m
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DownloadableAnimation.h"

#import "AnimationDownloadDelegate.h"

@interface DownloadableAnimation() <AnimationDownloadDelegate>

@property (readwrite) AnimationType animationType;
@property (readwrite) DesertCharacterOrientation orientation;
@property (readwrite) NSString* characterName;

@property NSArray<SKTexture*>* animationTextures;

@end

@implementation DownloadableAnimation

BOOL _isDownloaded = NO;

-(instancetype)initWith:(NSString*)characterName andWithAnimationType:(AnimationType)animationType andWithOrientation:(DesertCharacterOrientation)orientation{
    
    self = [super init];
    
    if(self){
        
        _isDownloaded = NO;
    }
    
    return self;
}

-(BOOL)isDownloaded{
    return _isDownloaded;
}

-(SKAction *)animation{
    
    return [SKAction animateWithTextures:self.animationTextures timePerFrame:0.40];
}

//MARK: ******** Animation Download Delegate Methods

-(void)didFinishDownloadingAnimationTextures:(NSArray<SKTexture *> *)textures{
    
    //TODO: ****** Assign to the textures property
    
    _isDownloaded = YES;
}

-(void)didFailToDownloadAnimationTexturesWith:(NSError *)error{
    
    _isDownloaded = NO;
}

@end
