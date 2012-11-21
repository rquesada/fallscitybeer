//
//  NewletterViewController.h
//  FallsCityBeer
//
//  Created by Roy Quesada on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface NewletterViewController : UIViewController <UITextFieldDelegate>{

}
@property (nonatomic, retain) IBOutlet UIButton *sendButton;
@property (nonatomic, retain) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UIView *formContainerView;
@property (nonatomic, retain) IBOutlet UIView *thanksContainerView;

-(IBAction)sendAction:(id)sender;

- (void) hide;
@end
