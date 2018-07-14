//
//  DetailsViewController.m
//  
//
//  Created by Somtochukwu Nweke on 7/13/18.
//

#import "DetailsViewController.h"
#import "Post.h"
#import "ParseUI.h"
#import "Parse.h"
#import "DateTools.h"


@interface DetailsViewController ()

@end




@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

        self.CaptionLabel.text = self.post.caption;
    
    // self.Date.text= self.post.createdAt;
    self.ImageView.file = self.post.image;
    [self.ImageView loadInBackground];
  
    NSString *timeAgoDate = [NSDate shortTimeAgoSinceDate:self.post.createdAt];
    self.Timestamp.text = timeAgoDate;
    
    //self.ImageView. = self.post.caption;
    
    //self.Timestamp = self.post.caption;
    
    
    // Do any additional setup after loading the view.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/





@end
