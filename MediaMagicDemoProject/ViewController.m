//
//  ViewController.m
//  MediaMagicDemoProject
//
//  Created by Flairsoft Consulting Group on 09/03/20.
//  Copyright © 2020 Project. All rights reserved.
//

#import "ViewController.h"
#import "CollectionViewCell.h"
@interface ViewController (){
    NSArray * dataArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    [self getPhotosData];
}

-(void)getPhotosData{
    NSString *string = @"https://picsum.photos/list";
       id jsonData = [self getData:string];
    if ([jsonData isKindOfClass:[NSArray class]]) {
        dataArray = [[NSArray alloc] initWithArray:jsonData];
        [_collectionViewOutlet reloadData];
    }
}

-(id)getData:(NSString*)urlString
{
    
//  __block id jsonObject = Nil;
//    NSURLSession *session = [NSURLSession sharedSession];
//       NSURLSessionDataTask *dataTask = [session dataTaskWithURL:[NSURL URLWithString:@"https://picsum.photos/list"] completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//           id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
//           jsonObject = json;
//           NSLog(@"%@", json);
//       }];
//
//       [dataTask resume];
//
id jsonObject = Nil;
    NSURL *url = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    NSData *data = [NSData dataWithContentsOfURL:url];

if(data!=nil){
    NSError *error = Nil;

    jsonObject =[NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
}

    return jsonObject;
    
}

#pragma UICollectionViewDataSource
 
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return dataArray.count;
}



- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
static NSString *cellIdentifier = @"cell";
CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];

cell.lblOutlet.text = [dataArray[indexPath.row]valueForKey:@"author"];
cell.imageOutlet.image = [self getImage:[dataArray[indexPath.row]valueForKey:@"id"]];

return cell;
}

-(UIImage*)getImage:(NSString*)imageUrl{

imageUrl = [NSString stringWithFormat:@"https://picsum.photos/300/300?image=%@",imageUrl];
NSURL *url = [NSURL URLWithString:[imageUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
NSData *data = [NSData dataWithContentsOfURL:url];

UIImage * img = [UIImage imageWithData:data];
return img;
}



@end
