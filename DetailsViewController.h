//
//  DetailsViewController.h
//  
//
//  Created by Somtochukwu Nweke on 7/13/18.
//

#import <UIKit/UIKit.h>
#import "Post.h"
#import "ParseUI.h"

@interface DetailsViewController : UIViewController
@property (weak ,nonatomic) Post *post;

@property (weak, nonatomic) IBOutlet UILabel *CaptionLabel;
@property (weak, nonatomic) IBOutlet PFImageView *ImageView;

@property (weak, nonatomic) IBOutlet UILabel *Timestamp;


@end
