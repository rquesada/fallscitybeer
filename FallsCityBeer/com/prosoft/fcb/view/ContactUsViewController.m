//
//  ContactUsViewController.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ContactUsViewController.h"

@interface ContactUsViewController ()

@end

@implementation ContactUsViewController
@synthesize yourEmailLabel,yourEmailTextField,subjectTextField,messageTextView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
    }
    return self;
}
-(IBAction)sendButtonAction:(id)sender{
    NSLog(@"Send");
}

- (void) hide{
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *) event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([yourEmailTextField isFirstResponder] && (yourEmailTextField != touch.view)){
        [yourEmailTextField resignFirstResponder];
    }
    if ([subjectTextField isFirstResponder] && (subjectTextField != touch.view)){
        [subjectTextField resignFirstResponder];
    }
    if ([messageTextView isFirstResponder] && (messageTextView != touch.view)){
        [messageTextView resignFirstResponder];
        
        [UIView animateWithDuration:0.3 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(0, 0);
        } ];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    
    if (textField == yourEmailTextField) {
        NSLog(@"yourEmailTextField");
    }

    
    return YES;
}

//UitextView Delegate
- (BOOL)textView:(UITextView *)txtView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    if( [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location == NSNotFound ) {
        return YES;
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, 0);
    } ];
    [txtView resignFirstResponder];
    return NO;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    NSLog(@"start editing");
	[UIView animateWithDuration:0.3 animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0,-135);
	} ];
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    return YES;
}

//View Delegates
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Delegates
    yourEmailTextField.delegate = self;
    subjectTextField.delegate = self;
    messageTextView.delegate = self;
    
    yourEmailLabel.font = [UIUtils getOfficialFontWithSize:17];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
