//
//  FeedViewController.h
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/11/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeedViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *logOut;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *compose;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
