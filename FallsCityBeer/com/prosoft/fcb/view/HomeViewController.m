//
//  HomeViewController.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "HomeViewController.h"

@implementation HomeViewController
@synthesize animationStatus,rightView,leftView;

NSString * const ANIMATION_ON_PROGRESS = @"animationOnProgress";
NSString * const ANIMATION_JUST_END = @"animationJustEnd";
NSString * const ANIMATION_CAN_START = @"animationCanStart";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Home", @"Home");
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; 
        animationStatus = ANIMATION_CAN_START;
        
    }
    return self;
}

- (void) startAnimation{
    animationStatus = ANIMATION_ON_PROGRESS;
    
    
	[UIView animateWithDuration:0.7 animations:^{
        leftView.transform = CGAffineTransformMakeTranslation(-120,30);
        leftView.alpha = 0.3;
        rightView.transform = CGAffineTransformMakeTranslation(190,50);
        rightView.alpha = 0.3;
        
        [[leftView layer] setRasterizationScale:0.6];
        [[leftView layer] setShouldRasterize:YES];

        [[rightView layer] setRasterizationScale:0.6];
        [[rightView layer] setShouldRasterize:YES];
        
	} completion:^(BOOL finished)
	 {
		 NSLog(@"animation end");
         animationStatus = ANIMATION_JUST_END;
         [[appDelegate tabBarController] setSelectedIndex:1];
         leftView.transform = CGAffineTransformMakeTranslation(0,0);
         leftView.alpha=1;
         rightView.transform = CGAffineTransformMakeTranslation(0,0);
         rightView.alpha=1;
         
         [[leftView layer] setRasterizationScale:1];
         [[leftView layer] setShouldRasterize:YES];
         
         [[rightView layer] setRasterizationScale:1];
         [[rightView layer] setShouldRasterize:YES];
         
         animationStatus = ANIMATION_CAN_START;
	 }];
}

#pragma mark - View lifecycle
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    topBarViewController = [TopBarViewController sharedInstance];
    topBarViewController.view.contentMode = UIViewContentModeTop;
    [self.view addSubview:topBarViewController.view];
}
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
    [super viewDidLoad];

}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
