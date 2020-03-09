//
//  CollectionViewCell.h
//  MediaMagicDemoProject
//
//  Created by Flairsoft Consulting Group on 09/03/20.
//  Copyright © 2020 Project. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageOutlet;
@property (weak, nonatomic) IBOutlet UILabel *lblOutlet;

@end

NS_ASSUME_NONNULL_END
