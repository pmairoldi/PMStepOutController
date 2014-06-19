//
//  GroupPhotoViewController.m
//  PhotoGroup
//
//  Created by Pierre-Marc Airoldi on 2014-06-06.
//  Copyright (c) 2014 Pierre-Marc Airoldi. All rights reserved.
//

#import "CollectionViewController.h"
#import "PhotoModel.h"
#import "PhotoCell.h"

#define kCellIdentifier @"cell_identifier"

#import <PMStepOutController/PMStepOutController.h>

@interface CollectionViewController ()

@property PhotoModel *model;

@end

@implementation CollectionViewController

-(instancetype)init {
    
    self = [super initWithCollectionViewLayout:[UICollectionViewFlowLayout new]];
    
    if (self) {
        
        _model = [[PhotoModel alloc] init];
    }
    
    return self;
}

-(void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.title = @"Cats";
    
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.alwaysBounceVertical = YES;
    
    [self.collectionView registerClass:[PhotoCell class] forCellWithReuseIdentifier:kCellIdentifier];
}

-(void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];

}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [_model.images count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = (PhotoCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
    
    cell.imageView.image = [_model getImageAtIndexPath:indexPath];
    
    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat itemSize = floor(CGRectGetWidth(collectionView.frame) / 3) - 1;
    
    return CGSizeMake(itemSize, itemSize);
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    
    return 2.0;
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    
    return 2.0;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = (PhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    
    PMStepOutController *controller = [[PMStepOutController alloc] initWithView:cell];
    
    [self.navigationController presentViewController:controller animated:YES completion:nil];
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
}


@end
