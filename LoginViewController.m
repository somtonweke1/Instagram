//
//  LoginViewController.m
//  Instagram
//
//  Created by Somtochukwu Nweke on 7/11/18.
//  Copyright © 2018 Somtochukwu Nweke. All rights reserved.
//

#import "LoginViewController.h"
#import "Parse.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)registerUser {
    // initialize a user object
    PFUser *newUser = [PFUser user];
    
    // set user properties
    newUser.username = self.userName.text;
    
    newUser.password = self.passWord.text;
    
    // call sign up function on the object
    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError * error) {
        if (error != nil) {
            NSLog(@"Error: %@", error.localizedDescription);
        } else {
            NSLog(@"User registered successfully");
            
            // manually segue to logged in view
        }
    }];
}




- (void)loginUser {
    NSString *username = self.userName.text;
    NSString *password = self.passWord.text;
    
    [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser * user, NSError *  error) {
        if (error != nil) {
            NSLog(@"User log in failed: %@", error.localizedDescription);
        } else {
            NSLog(@"User logged in successfully");
            [self performSegueWithIdentifier:@"Control" sender:nil];
            
            
            // display view controller that needs to shown after successful login
        }
    }];
}




- (IBAction)logIn:(id)sender {
    [self loginUser];
}


- (IBAction)signUp:(id)sender {
    [self registerUser];
    
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
