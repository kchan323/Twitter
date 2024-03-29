//
//  DetailsViewController.m
//  twitter
//
//  Created by kchan23 on 7/3/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "DetailsViewController.h"
#import "UIImageView+AFNetworking.h"
#import "APIManager.h"

@interface DetailsViewController ()
    
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *retweetCount;
@property (weak, nonatomic) IBOutlet UILabel *favoriteCount;
@property (weak, nonatomic) IBOutlet UIButton *retweetButton;
@property (weak, nonatomic) IBOutlet UIButton *favoriteButton;
@property (weak, nonatomic) IBOutlet UILabel *retweetLabel;
@property (weak, nonatomic) IBOutlet UILabel *favoriteLabel;
    
@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    User *user = self.tweet.user;
    
    self.authorLabel.text = user.name;
    NSString *at = @"@";
    NSString *username = [at stringByAppendingString:user.screenName];
    self.userLabel.text = username;
    self.tweetLabel.text = self.tweet.text;
    
    NSURL *profileURL = [NSURL URLWithString:user.profilePicture];
    self.profileView.image = nil;
    [self.profileView setImageWithURL:profileURL];
    
    [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon"] forState:UIControlStateNormal];
    [self.retweetButton setImage:[UIImage imageNamed:@"retweet-icon-green"] forState:UIControlStateSelected];
    [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon"] forState:UIControlStateNormal];
    [self.favoriteButton setImage:[UIImage imageNamed:@"favor-icon-red"] forState:UIControlStateSelected];
    
    self.retweetLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    self.favoriteLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
    
    self.dateLabel.text = self.tweet.createdAtString;
    
    NSString *retweetNum = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
    NSString *favoriteNum = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];

    self.retweetCount.text = [retweetNum stringByAppendingString:@" Retweets"];
    self.favoriteCount.text = [favoriteNum stringByAppendingString:@" Likes"];
}
    
- (IBAction)didTapRetweet:(id)sender {
    if(self.tweet.retweeted == NO){
        [[APIManager shared] retweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error retweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully retweeted the following Tweet: %@", tweet.text);
                self.tweet.retweeted = YES;
                self.tweet.retweetCount += 1;
                [self.retweetButton setSelected:YES];
                self.retweetLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
            }
        }];
    }
    else {
        [[APIManager shared] unretweet:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unretweeting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unretweeted the following Tweet: %@", tweet.text);
                self.tweet.retweeted = NO;
                self.tweet.retweetCount -= 1;
                [self.retweetButton setSelected:NO];
                self.retweetLabel.text = [NSString stringWithFormat:@"%d", self.tweet.retweetCount];
            }
        }];
    }
}
    
- (IBAction)didTapLike:(id)sender {
    if(self.tweet.favorited == NO){
        [[APIManager shared] favorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error favoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully favorited the following Tweet: %@", tweet.text);
                self.tweet.favorited = YES;
                self.tweet.favoriteCount += 1;
                [self.favoriteButton setSelected:YES];
                self.favoriteLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
            }
        }];
    }
    else {
        [[APIManager shared] unfavorite:self.tweet completion:^(Tweet *tweet, NSError *error) {
            if(error){
                NSLog(@"Error unfavoriting tweet: %@", error.localizedDescription);
            }
            else{
                NSLog(@"Successfully unfavorited the following Tweet: %@", tweet.text);
                self.tweet.favorited = NO;
                self.tweet.favoriteCount -= 1;
                [self.favoriteButton setSelected:NO];
                self.favoriteLabel.text = [NSString stringWithFormat:@"%d", self.tweet.favoriteCount];
            }
        }];
    }
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
