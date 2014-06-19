//
//  PhotoModel.h
//  PhotoGroup
//
//  Created by Pierre-Marc Airoldi on 2014-06-06.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PhotoModel : NSObject

@property NSMutableArray *images;

-(UIImage *)getImageAtIndexPath:(NSIndexPath *)indexPath;

@end
