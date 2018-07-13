//
//  Post.h
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/12/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Parse/Parse.h"


@interface Post : PFObject<PFSubclassing>

@property (nonatomic, strong) NSString *postID;
@property (nonatomic, strong) NSString *userID;
@property (nonatomic, strong) PFUser *author;

@property (nonatomic, strong) NSString *caption;
@property (nonatomic, strong) PFFile *image;
@property (nonatomic, strong) NSNumber *likeCount;
@property (nonatomic, strong) NSNumber *commentCount;

+ (void) postUserImage: ( UIImage * _Nullable )image withCaption: ( NSString * _Nullable )caption withCompletion: (PFBooleanResultBlock  _Nullable)completion;

@end
