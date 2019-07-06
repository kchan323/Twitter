//
//  UserTweetCell.h
//  twitter
//
//  Created by kchan23 on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"

NS_ASSUME_NONNULL_BEGIN

@interface UserTweetCell : UITableViewCell
    
@property (weak, nonatomic) IBOutlet UIImageView *profileView;
    @property (weak, nonatomic) IBOutlet UILabel *authorLabel;
    @property (weak, nonatomic) IBOutlet UILabel *tweetLabel;
    @property (weak, nonatomic) IBOutlet UILabel *userLabel;
    @property (weak, nonatomic) IBOutlet UILabel *dateLabel;
    @property (strong, nonatomic) Tweet *tweet;
    
-(void) setTweet: (Tweet *) tweet;

@end

NS_ASSUME_NONNULL_END
