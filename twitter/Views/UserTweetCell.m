//
//  UserTweetCell.m
//  twitter
//
//  Created by kchan23 on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import "UserTweetCell.h"
#import "Tweet.h"
#import "UIImageView+AFNetworking.h"

@implementation UserTweetCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setTweet: (Tweet *) tweet {
    
    _tweet = tweet;
    
    self.authorLabel.text = self.tweet.user.name;
    NSString *at = @"@";
    NSString *username = [at stringByAppendingString:self.tweet.user.screenName];
    self.userLabel.text = username;
    self.tweetLabel.text = self.tweet.text;
    
    NSURL *profileURL = [NSURL URLWithString:self.tweet.user.profilePicture];
    self.profileView.image = nil;
    [self.profileView setImageWithURL:profileURL];
    
    self.dateLabel.text = self.tweet.createdAtString;}
    
@end
