//
//  NewletterViewController.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 4/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "NewletterViewController.h"

@interface NewletterViewController ()

@end

@implementation NewletterViewController
@synthesize sendButton,emailTextField,formContainerView,thanksContainerView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self.view addSubview:thanksContainerView];
       
    }
    return self;
}


- (void) hide{
    [emailTextField resignFirstResponder];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *) event
{
    UITouch *touch = [[event allTouches] anyObject];
    if ([emailTextField isFirstResponder] && (emailTextField != touch.view)){
        [emailTextField resignFirstResponder];
    }
}

-(IBAction)sendAction:(id)sender{
    NSLog(@"Send!!");
    formContainerView.hidden  =YES;
    thanksContainerView.hidden =NO;
    [NSTimer scheduledTimerWithTimeInterval:3.0
                                     target:self
                                   selector:@selector(backToForm)
                                   userInfo:nil
                                    repeats:NO];
}

- (void) backToForm{
    formContainerView.hidden  =NO;
    thanksContainerView.hidden =YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
     emailTextField.delegate = self;
	// Do any additional setup after loading the view.
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
