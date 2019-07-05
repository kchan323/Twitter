//
//  ProfileViewController.m
//  twitter
//
//  Created by kchan23 on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "ProfileViewController.h"
#import "UIImageView+AFNetworking.h"


@interface ProfileViewController ()
    
@property (weak, nonatomic) IBOutlet UIImageView *backdropView;
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
    @property (weak, nonatomic) IBOutlet UILabel *authorLabel;
    @property (weak, nonatomic) IBOutlet UILabel *userLabel;
    @property (weak, nonatomic) IBOutlet UILabel *bioLabel;
    @property (weak, nonatomic) IBOutlet UILabel *tweetCount;
    @property (weak, nonatomic) IBOutlet UILabel *followingCount;
    @property (weak, nonatomic) IBOutlet UILabel *followersCount;
    

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.authorLabel.text = self.user.name;
    NSString *at = @"@";
    NSString *username = [at stringByAppendingString:self.user.screenName];
    self.userLabel.text = username;
    self.bioLabel.text = self.user.bio;
    
    NSURL *backgroundURL = [NSURL URLWithString:self.user.backgroundPicture];
    self.backdropView.image = nil;
    [self.backdropView setImageWithURL:backgroundURL];
    
    NSURL *profileURL = [NSURL URLWithString:self.user.profilePicture];
    self.profileView.image = nil;
    [self.profileView setImageWithURL:profileURL];
    
    self.tweetCount.text = [self.user.tweetCount stringByAppendingString:@" Tweets"];
    self.followingCount.text = [self.user.followingCount stringByAppendingString:@" Following"];
    self.followersCount.text = [self.user.followersCount stringByAppendingString:@" Followers"];
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
