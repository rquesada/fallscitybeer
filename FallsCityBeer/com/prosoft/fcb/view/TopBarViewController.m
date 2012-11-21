//
//  TopBarViewController.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 4/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TopBarViewController.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
@interface TopBarViewController ()

@end

@implementation TopBarViewController
@synthesize newsLetterButton,calendarButton, contactUsButton, twitterButton, facebookButton;
static TopBarViewController *topViewControllerInstance = nil;


+(TopBarViewController *) sharedInstance {
	@synchronized(self){
		if(topViewControllerInstance == nil){
			topViewControllerInstance= [[self alloc] initWithNibName:@"TopViewController" bundle:[NSBundle mainBundle]];
		}
	}
	return topViewControllerInstance;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.view.contentMode = UIViewContentModeLeft;
        
        //NewsLetter
        newletterViewController = [[NewletterViewController alloc] initWithNibName:@"Newsletter" bundle:[NSBundle mainBundle]];
        newletterViewController.view.frame = CGRectMake(26, 
                                                        125, 
                                                        newletterViewController.view.frame.size.width,
                                                        newletterViewController.view.frame.size.height);
        [self.view addSubview:newletterViewController.view];
        newletterViewController.view.hidden = YES;
        
        //ContactUs
        contactUsViewController = [[ContactUsViewController alloc] initWithNibName:@"ContactUs" bundle:[NSBundle mainBundle]];
        contactUsViewController.view.frame = CGRectMake(13, 
                                                        115, 
                                                        contactUsViewController.view.frame.size.width,
                                                        contactUsViewController.view.frame.size.height);
        [self.view addSubview:contactUsViewController.view];
        contactUsViewController.view.hidden = YES;
        //lastPressed = nil;
        
        //Twitters 
        twitterViewController = [[TwitterViewController alloc] initWithNibName:@"Twitter" bundle:[NSBundle mainBundle]];
        twitterViewController.view.frame = CGRectMake(13, 
                                                        115, 
                                                        twitterViewController.view.frame.size.width,
                                                        twitterViewController.view.frame.size.height);
        [self.view addSubview:twitterViewController.view];
        twitterViewController.view.hidden = YES;
        
        //Facebook 
        facebookViewController = [[FacebookViewController alloc] initWithNibName:@"Facebook" bundle:[NSBundle mainBundle]];
        facebookViewController.view.frame = CGRectMake(13, 
                                                       115, 
                                                       facebookViewController.view.frame.size.width,
                                                       facebookViewController.view.frame.size.height);
        [self.view addSubview:facebookViewController.view];
        facebookViewController.view.hidden = YES;
        
        lastPressed = nil;
    }
    
    return self;
}

-(IBAction)buttonAction:(id)sender{
    lastPressed = sender;
    
    if(lastPressed != nil){ 
        lastPressed.selected= FALSE;
    
        if (lastPressed == newsLetterButton) {
            newsLetterButton.selected = YES;
            contactUsButton.selected = NO;
            contactUsViewController.view.hidden = YES;
            twitterViewController.view.hidden   = YES;
            facebookViewController.view.hidden  = YES;
            [self showNewsletter];
        }else if (lastPressed == contactUsButton){
            
            contactUsButton.selected  = YES;
            newsLetterButton.selected = NO;
            twitterButton.selected    = NO;
            facebookButton.selected   = NO;
            newletterViewController.view.hidden = YES;
            twitterViewController.view.hidden   = YES;
            facebookViewController.view.hidden  = YES;
            [self showContactUs];
        }else if (lastPressed == twitterButton){
            twitterButton.selected    = YES;
            contactUsButton.selected  = NO;
            newsLetterButton.selected = NO;
            facebookButton.selected   = NO;
            newletterViewController.view.hidden = YES;
            contactUsViewController.view.hidden = YES;
            facebookViewController.view.hidden  = YES;
            [self showTwitter];
        }else if (lastPressed == facebookButton){
            facebookButton.selected   = YES;
            contactUsButton.selected  = NO;
            newsLetterButton.selected = NO;
            twitterButton.selected    = NO;
            newletterViewController.view.hidden = YES;
            contactUsViewController.view.hidden = YES;
            twitterViewController.view.hidden   = YES;
            [self showFacebook];
        }
        
    }    
}

- (BOOL) showCalendar{
    BOOL value;
    
    
    return value;
}

- (BOOL) showContactUs{
    BOOL value;

    if(contactUsViewController.view.hidden){
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     425);
        value = YES;
        
    }else {
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     106);
        [contactUsViewController hide];
        contactUsButton.selected = NO;
        value = NO;
    }
    contactUsViewController.view.hidden = !contactUsViewController.view.hidden;
    
    return value;
}

- (BOOL) showNewsletter{
    BOOL value;
    
    if(newletterViewController.view.hidden){
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     425);
        value = YES;
        
    }else {
        
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     106);
        [newletterViewController hide];
        newsLetterButton.selected = NO;
        value = NO;
    }
    newletterViewController.view.hidden = !newletterViewController.view.hidden;
    return value;
}

- (BOOL) showTwitter{
    BOOL value;
    
    if(twitterViewController.view.hidden){
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     425);
        value = YES;
        
    }else {
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     106);
        [twitterViewController hide];
        twitterButton.selected = NO;
        value = NO;
    }
    twitterViewController.view.hidden = !twitterViewController.view.hidden;
    
    return value;
}


- (BOOL) showFacebook{
    BOOL value;
    
    if(facebookViewController.view.hidden){
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     425);
        value = YES;
        
    }else {
        self.view.frame = CGRectMake(0, 
                                     self.view.frame.origin.y,
                                     self.view.frame.size.width, 
                                     106);
        [facebookViewController hide];
        facebookButton.selected = NO;
        value = NO;
    }
    facebookViewController.view.hidden = !facebookViewController.view.hidden;
    
    return value;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
