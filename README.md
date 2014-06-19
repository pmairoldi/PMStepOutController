# PMStepOutController

[![Version](https://img.shields.io/cocoapods/v/PMStepOutController.svg?style=flat)](http://cocoadocs.org/docsets/PMStepOutController)
[![License](https://img.shields.io/cocoapods/l/PMStepOutController.svg?style=flat)](http://cocoadocs.org/docsets/PMStepOutController)
[![Platform](https://img.shields.io/cocoapods/p/PMStepOutController.svg?style=flat)](http://cocoadocs.org/docsets/PMStepOutController)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

	#import <PMStepOutController/PMStepOutController.h>

	//any UView or UIView subclass will work. Here is an example of a UICollectionViewCell
	UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    PMStepOutController *controller = [[PMStepOutController alloc] initWithView:cell];
    
    [self.navigationController presentViewController:controller animated:YES completion:nil];

## Requirements

## Installation

PMStepOutController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

    pod "PMStepOutController"

## Author

Pierre-Marc Airoldi, pierremarcairoldi@gmail.com

## License

PMStepOutController is available under the MIT license. See the LICENSE file for more info.