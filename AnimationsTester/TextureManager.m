//
//  TextureManager.m
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TextureManager.h"

@interface TextureManager()


@property (readwrite) SKTextureAtlas* idleTextureAtlas;
@property (readwrite) SKTextureAtlas* runTextureAtlas;
@property (readwrite) SKTextureAtlas* walkTextureAtlas;
@property (readwrite) SKTextureAtlas* shootTextureAtlas;
@property (readwrite) SKTextureAtlas* jumpTextureAtlas;


@end

@implementation TextureManager

static TextureManager* sharedManager = nil;

+(TextureManager*)sharedManager{
    
    if(sharedManager == nil){
        sharedManager = [[super allocWithZone:NULL] init];
    }
    
    return sharedManager;
}

-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        _idleTextureAtlas = [SKTextureAtlas atlasNamed:@"Idle"];
        _runTextureAtlas = [SKTextureAtlas atlasNamed:@"Run"];
        _walkTextureAtlas = [SKTextureAtlas atlasNamed:@"Walk"];
        _shootTextureAtlas = [SKTextureAtlas atlasNamed:@"Shoot"];
        _jumpTextureAtlas = [SKTextureAtlas atlasNamed:@"Jump"];

    }
    
    return self;
}


@end
