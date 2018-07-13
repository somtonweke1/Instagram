//
//  PostCell.h
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/13/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"

@interface PostCell : UITableViewCell

@property (nonatomic, strong) Post *post;

@property (weak, nonatomic) IBOutlet PFImageView *ImageViiew;

@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UILabel *Caption;
@property (weak, nonatomic) IBOutlet UILabel *Date;



@end
