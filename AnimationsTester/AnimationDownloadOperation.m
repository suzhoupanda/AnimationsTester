//
//  AnimationDownloadOperation.m
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

@import CloudKit;

#import <Foundation/Foundation.h>
#import "AnimationDownloadOperation.h"
#import "AnimationDownloadDelegate.h"


@interface AnimationDownloadOperation()

@property CKContainer* container;
@property CKDatabase* publicDB;

@property DownloadableAnimation* downloadableAnimation;

@property (readonly) NSPredicate* queryPredicate;
@property (readonly) CKQuery* animationQuery;

@property (weak) id<AnimationDownloadDelegate> delegate;

@end

@implementation AnimationDownloadOperation

static NSString* kContainerIdentifier = @"iCloud.ChangzhouPanda.AnimationsTester";
static NSString* kAnimationRecordType = @"Animation";

CKQuery* _animationQuery;
NSPredicate* _queryPredicate;

-(instancetype)initWith:(DownloadableAnimation*)downloadableAnimation{
    
    self = [super init];
    
    if(self){
        self.container = [CKContainer containerWithIdentifier:kContainerIdentifier];
        self.publicDB = [self.container publicCloudDatabase];
        self.downloadableAnimation = downloadableAnimation;
        self.delegate = self.downloadableAnimation;
    }
    
    return self;
}

-(void)main{
    
    if(self.isCancelled){
        return;
        
    }
    
    if(self.downloadableAnimation.isDownloaded){
        return;
    }
    
    
}

-(void)downloadAnimation{
    
    [self.publicDB performQuery:self.animationQuery inZoneWithID:nil completionHandler:^(NSArray<CKRecord*>* results, NSError* error){
        
        if(error){
            NSError* error;
            [self.delegate didFailToDownloadAnimationTexturesWith:error];
            
            return;
        }
        
        if(results.count <= 0){
            NSError* error;
            [self.delegate didFailToDownloadAnimationTexturesWith:error];
            
            return;
        }
        
        CKRecord* animation = [results firstObject];
        
        if(animation == nil){
            NSError* error;
            [self.delegate didFailToDownloadAnimationTexturesWith:error];
            
            return;
        }
        
        if(animation){
            
            //TODO: convert CKRecord into an animation
            
            NSArray<SKTexture*>* textures;
            
            [self.delegate didFinishDownloadingAnimationTextures:textures];
            
        

        }
        
        
    }];
}

-(NSPredicate *)queryPredicate{
    
    if(_queryPredicate == nil){
        _queryPredicate = [NSPredicate predicateWithFormat:@"characterName LIKE %@ AND animationType == %d AND orientation == %d", self.downloadableAnimation.characterName,self.downloadableAnimation.animationType,self.downloadableAnimation.orientation];
    }
    return _queryPredicate;
}

-(CKQuery *)animationQuery{
    
    if(_animationQuery == nil){
        _animationQuery = [[CKQuery alloc] initWithRecordType:kAnimationRecordType predicate:self.queryPredicate];
    }
    
    return _animationQuery;
}

@end
