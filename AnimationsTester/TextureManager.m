//
//  TextureManager.m
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextureManager.h"
#import "AnimationDownloadOperation.h"


@interface TextureManager()


@property (readonly) DownloadableAnimation* idleLeftAnimation;
@property (readonly) DownloadableAnimation* idleRightAnimation;
@property (readonly) DownloadableAnimation* runLeftAnimation;
@property (readonly) DownloadableAnimation* runRightAnimaation;

@property NSOperationQueue* downloadOperationQueue;




@end


@implementation TextureManager

static TextureManager* sharedManager = nil;


AnimationDownloadOperation* _idleLeftAnimationOperation;
AnimationDownloadOperation* _idleRightAnimationOperation;
AnimationDownloadOperation* _runLeftAnimationOperation;
AnimationDownloadOperation* _runRightAnimationOperation;


+(TextureManager*)sharedManager{
    if(sharedManager == nil){
        sharedManager = [[super allocWithZone:nil] init];
    }
    
    return sharedManager;
}

-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        _idleLeftAnimation = [[DownloadableAnimation alloc] initWith:@"DesertHeroGuy" andWithAnimationType:IDLE andWithOrientation:LEFT];
        
        _idleLeftAnimationOperation = [[AnimationDownloadOperation alloc] initWith:self.idleLeftAnimation];
        
        [self.downloadOperationQueue addOperation:_idleLeftAnimationOperation];
        
        
        _idleRightAnimationOperation = [[AnimationDownloadOperation alloc] initWith:self.idleRightAnimation];
        
    }
    
    return self;
}

@end
