//
//  BeerViewController.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "BeerViewController.h"

@implementation BeerViewController
@synthesize beerButton,beerFrameContainer,backButton;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Beer", @"Beer");
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate]; 
//        [[appDelegate tabBarController] setDelegate:self];
    }
    return self;
}

// Optional UITabBarControllerDelegate method.
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    NSLog(@"here");
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"didSelectViewController tabbar");
}



// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
    NSLog(@"dissmised tabbar");
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)beerAction:(id)sender{
    [beerButton setHidden:YES];
    beerFrameContainer.frame = CGRectMake(10,
                                          115, 
                                          beerFrameContainer.frame.size.width, 
                                          beerFrameContainer.frame.size.height);
    
    [self.view insertSubview:beerFrameContainer belowSubview:topBarViewController.view];
}

-(IBAction)backAction:(id)sender{
    [beerFrameContainer removeFromSuperview];
    [beerButton setHidden:NO];
}

#pragma mark - View lifecycle
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
