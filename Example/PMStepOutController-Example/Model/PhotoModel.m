//
//  PhotoModel.m
//  PhotoGroup
//
//  Created by Pierre-Marc Airoldi on 2014-06-06.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#import "PhotoModel.h"

@interface PhotoModel ()

@end

@implementation PhotoModel

-(instancetype)init {
    
    self = [super init];
    
    if (self){
        
        _images = [NSMutableArray new];
   
        NSFileManager *filemanager = [NSFileManager defaultManager];
    
        NSDirectoryEnumerator *dirEnumerator = [filemanager enumeratorAtURL:[[NSBundle mainBundle] resourceURL] includingPropertiesForKeys:@[NSURLNameKey] options:NSDirectoryEnumerationSkipsSubdirectoryDescendants|NSDirectoryEnumerationSkipsPackageDescendants|NSDirectoryEnumerationSkipsHiddenFiles errorHandler:nil];
        
        for (NSURL *theURL in dirEnumerator) {
            
            NSString *fileName;
            [theURL getResourceValue:&fileName forKey:NSURLNameKey error:NULL];
            
            NSNumber *isDirectory;
            [theURL getResourceValue:&isDirectory forKey:NSURLIsDirectoryKey error:NULL];
            
            if ([fileName rangeOfString:@"cat"].location != NSNotFound) {
                [_images addObject:fileName];
            }
        }
    }
    
    return self;
}

-(UIImage *)getImageAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row < _images.count) {
        return [UIImage imageNamed:_images[indexPath.row]];
    }
    
    else {
        return nil;
    }
}

@end
