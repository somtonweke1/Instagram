//
//  FeedViewController.m
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/11/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import "FeedViewController.h"
#import "Parse.h"
#import "AppDelegate.h"
#import "LoginViewController.h"
#import "Post.h"
#import "PostCell.h"
#import "DetailsViewController.h"
#import "CameraViewController.h"

@interface FeedViewController () <UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong ) NSArray *posts;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;


@end

@implementation FeedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;
    
    //Initialize NSArray for use
    self.posts = [[NSArray alloc]init];
    
    //Call the method to fetch posts
    [self fetchPosts];
    
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    // Do any additional setup after loading the view.
    // Initialize a UIRefreshControl
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(beginRefresh:) forControlEvents:UIControlEventValueChanged];
    [self.myTableView insertSubview:refreshControl atIndex:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)beginRefresh: (UIRefreshControl *)refreshControl {
    [self fetchPosts];
    [refreshControl endRefreshing];
}


- (IBAction)logOut:(id)sender {
    [PFUser logOutInBackgroundWithBlock:^(NSError * _Nullable error) {
    // PFUser.current() will now be nil
        AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        UIStoryboard *storyboard = [UIStoryboard
                                    storyboardWithName:@"Main" bundle:nil];
        LoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        appDelegate.window.rootViewController = loginViewController;
        
      
}];
}


- (void)fetchPosts {
    
PFQuery *postQuery = [Post query];
[postQuery orderByDescending:@"createdAt"];
[postQuery includeKey:@"author"];
postQuery.limit = 20;

// fetch data asynchronously
[postQuery findObjectsInBackgroundWithBlock:^(NSArray<Post *> *_Nullable posts, NSError * _Nullable error) {
    if (posts) {
        
        self.posts = posts;
        
        [self.myTableView reloadData];
        
        
        
        
        // do something with the data fetched
    }
    else {
        // handle error
    }
}];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    PostCell *cell= [tableView dequeueReusableCellWithIdentifier:@"PostCell" forIndexPath:indexPath];
    
        cell.post = self.posts[indexPath.row];
    
    
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.posts.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqual: @"MoveToDetails"]){
        PostCell *tappedPost = sender;
        Post *post = tappedPost.post;
        
        DetailsViewController *detailsViewController = [segue destinationViewController];
        detailsViewController = [segue destinationViewController];
        detailsViewController.post = post;
    }
    else{
        CameraViewController *composeController = [segue destinationViewController];
    
        
    }
    
}

@end
