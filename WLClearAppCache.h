//
//  WLClearAppCache.h
//  WLClearCache
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WLClearAppCache : NSObject

+ (CGFloat)wlCurrentAppFileCacheCapacity;
+ (void)wlClearAppFileCache;

@end
