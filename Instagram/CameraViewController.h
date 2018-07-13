//
//  CameraViewController.h
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/12/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *placementPhoto;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *Share;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *Cancel;

@property (weak, nonatomic) IBOutlet UIButton *TakePicture;
@property (weak, nonatomic) IBOutlet UITextView *TextFieldforCaption;

@end
