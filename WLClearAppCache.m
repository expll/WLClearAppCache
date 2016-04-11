//
//  WLClearAppCache.m
//  WLClearCache
//
//  Created by DaChui on 4/11/16.
//  Copyright © 2016 wl. All rights reserved.
//

#import "WLClearAppCache.h"

@implementation WLClearAppCache

+ (CGFloat)wlCurrentAppFileCacheCapacity{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    CGFloat ret = [self fileSizeAtPath:docDir] + [self fileSizeAtPath:cachesDir];
    return ret;
}

+ (CGFloat) fileSizeAtPath:(NSString*) filePath{
    NSFileManager* manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]){
        CGFloat ret = [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
        ret = ret/(1024*1024); //MB
        return ret;
    }
    return 0;
}

+ (void)wlClearAppFileCache{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDir = [paths objectAtIndex:0];
    paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachesDir = [paths objectAtIndex:0];
    
    [self wlClearAppFile:docDir];
    [self wlClearAppFile:cachesDir];
}

+ (void)wlClearAppFile:(NSString *)docDir{
    NSFileManager *fileMgr = [[NSFileManager alloc] init];
    NSError *error = nil;
    NSArray *directoryContents = [fileMgr contentsOfDirectoryAtPath:docDir error:&error];
    if (error == nil) {
        for (NSString *path in directoryContents) {
            NSString *fullPath = [docDir stringByAppendingPathComponent:path];
            BOOL removeSuccess = [fileMgr removeItemAtPath:fullPath error:&error];
            if (!removeSuccess) {
                // Error handling
                
            }
        }
    } else {
        // Error handling
        
    }
}

@end
