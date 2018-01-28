//
//  DownloadableAnimation.h
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#ifndef DownloadableAnimation_h
#define DownloadableAnimation_h

@import SpriteKit;
#import "DesertCharacterOrientation.h"
#import "AnimationType.h"

@interface DownloadableAnimation: NSObject


@property (readonly) AnimationType animationType;
@property (readonly) DesertCharacterOrientation orientation;
@property (readonly) NSString* characterName;

@property (readonly) SKAction* animation;

@property (readonly) BOOL isDownloaded;

-(instancetype)initWith:(NSString*)characterName andWithAnimationType:(AnimationType)animationType andWithOrientation:(DesertCharacterOrientation)orientation;


@end

#endif /* DownloadableAnimation_h */
