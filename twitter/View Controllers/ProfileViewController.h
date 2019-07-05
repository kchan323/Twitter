//
//  ProfileViewController.h
//  twitter
//
//  Created by kchan23 on 7/5/19.
//  Copyright © 2019 Emerson Malca. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tweet.h"
#import "User.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProfileViewController : UIViewController

@property (strong, nonatomic) Tweet *tweet;
@property (strong, nonatomic) User *user;

@end

NS_ASSUME_NONNULL_END
