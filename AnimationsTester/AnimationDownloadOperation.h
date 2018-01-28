//
//  AnimationDownloadOperation.h
//  AnimationsTester
//
//  Created by Aleksander Makedonski on 1/28/18.
//  Copyright © 2018 Aleksander Makedonski. All rights reserved.
//

#ifndef AnimationDownloadOperation_h
#define AnimationDownloadOperation_h

@import SpriteKit;
@import Foundation;


#import "DownloadableAnimation.h"



@interface AnimationDownloadOperation: NSOperation

-(instancetype)initWith:(DownloadableAnimation*)downloadableAnimation;

@end


#endif /* AnimationDownloadOperation_h */
