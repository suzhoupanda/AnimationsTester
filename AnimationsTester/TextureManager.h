//
//  TextureManager.h
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#ifndef TextureManager_h
#define TextureManager_h

@import Foundation;
@import SpriteKit;

@interface TextureManager: NSObject

+(TextureManager*)sharedManager;


@property (readonly) SKTextureAtlas* idleTextureAtlas;
@property (readonly) SKTextureAtlas* runTextureAtlas;
@property (readonly) SKTextureAtlas* walkTextureAtlas;
@property (readonly) SKTextureAtlas* shootTextureAtlas;
@property (readonly) SKTextureAtlas* jumpTextureAtlas;


@end

#endif /* TextureManager_h */
