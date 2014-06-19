//
//  PhotoView.m
//  PhotoGroup
//
//  Created by Pierre-Marc Airoldi on 2014-06-06.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#import "PhotoCell.h"

@implementation PhotoCell

-(instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.contentView.clipsToBounds = YES;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.contentView.frame), CGRectGetHeight(self.contentView.frame))];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.contentView addSubview:_imageView];
    }
    
    return self;
}

@end
