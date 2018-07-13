//
//  PostCell.m
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/13/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import "PostCell.h"
#import "ParseUI.h"


#import "Parse.h"
@implementation PostCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) setPost:(Post *)post{
    _post = post;
    
    self.UserName.text = self.post.author.username;
    
    self.Caption.text = self.post.caption;
    
   // self.Date.text= self.post.createdAt;
    self.ImageViiew.file = self.post.image;
    [self.ImageViiew loadInBackground];
    
    
}

@end
