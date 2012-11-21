//
//  TwitterCellViewController.h
//  FallsCityBeer
//
//  Created by Edel  Aguero M on 14/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwitterCellViewController : UITableViewCell

@property (nonatomic, retain) IBOutlet UIImageView *userImage;
@property (nonatomic, retain) IBOutlet UILabel *userName;
@property (nonatomic, retain) IBOutlet UITextView *userText;

@end
