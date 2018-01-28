//
//  AnimationDownloadDelegate.h
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#ifndef AnimationDownloadDelegate_h
#define AnimationDownloadDelegate_h

@import SpriteKit;

@protocol AnimationDownloadDelegate

-(void)didFinishDownloadingAnimationTextures:(NSArray<SKTexture*>*)textures;

-(void)didFailToDownloadAnimationTexturesWith:(NSError*)error;

@end

#endif /* AnimationDownloadDelegate_h */
