//
//  ViewController.h
//  MediaMagicDemoProject
//
//  Created by Flairsoft Consulting Group on 09/03/20.
//  Copyright © 2020 Project. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UICollectionViewDelegate,UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewOutlet;

@end

