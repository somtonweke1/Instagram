//
//  CameraViewController.m
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/12/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import "CameraViewController.h"
#import <UIKit/UIKit.h>
#import "Post.h"


@interface CameraViewController ()< UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@end

@implementation CameraViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    // Get the image captured by the UIImagePickerController
    UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
    UIImage *editedImage = info[UIImagePickerControllerEditedImage];
    
    editedImage = [self resizeImage:originalImage withSize:CGSizeMake(350, 350)];
    
    self.placementPhoto.image = editedImage;
    // Do something with the images (based on your use case)
    
    // Dismiss UIImagePickerController to go back to your original view controller
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void) selectPhoto {
    UIImagePickerController *imagePickerVC = [UIImagePickerController new];

    imagePickerVC.delegate =  self;
    imagePickerVC.allowsEditing = YES;
    imagePickerVC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [self presentViewController:imagePickerVC animated:YES completion:nil];
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selectButton:(id)sender {
    [self selectPhoto];
}

- (IBAction)DismissViewController:(id)sender {
    [self dismissViewControllerAnimated:(YES) completion:nil];
    
}
- (IBAction)ShareButton:(id)sender {
    

    
    [Post postUserImage:self.placementPhoto.image
            withCaption:self.TextFieldforCaption.text withCompletion:^(BOOL succeeded, NSError *error){
        if(succeeded){
             
            [self dismissViewControllerAnimated:YES completion:nil];
            
        }
        
    }];
}

- (UIImage *)resizeImage:(UIImage *)image withSize:(CGSize)size {
    UIImageView *resizeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    
    resizeImageView.contentMode = UIViewContentModeScaleAspectFill;
    resizeImageView.image = image;
    
    UIGraphicsBeginImageContext(size);
    [resizeImageView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

@end
