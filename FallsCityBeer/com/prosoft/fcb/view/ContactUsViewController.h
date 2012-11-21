//
//  ContactUsViewController.h
//  FallsCityBeer
//
//  Created by Roy Quesada on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIUtils.h"

@interface ContactUsViewController : UIViewController <UITextFieldDelegate,UITextViewDelegate>{
    
}
//properties
@property (nonatomic, retain) IBOutlet UILabel *yourEmailLabel;
@property (nonatomic, retain) IBOutlet UITextField *yourEmailTextField;
@property (nonatomic, retain) IBOutlet UITextField *subjectTextField;
@property (nonatomic, retain) IBOutlet UITextView *messageTextView;

//methods
- (void) hide;
@end
