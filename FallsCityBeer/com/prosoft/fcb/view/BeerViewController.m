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
        self.title = NSLocalizedString(@"Beer", @"Beer");
        appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        isShowBeerButton = YES;
    }
    return self;
}

// Optional UITabBarControllerDelegate method.
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
}



// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed{
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

-(IBAction)beerAction:(id)sender{
    isShowBeerButton = NO;
    
    beerFrameContainer.frame = CGRectMake(10,
                                          115, 
                                          beerFrameContainer.frame.size.width, 
                                          beerFrameContainer.frame.size.height);
    
    [self.view insertSubview:beerFrameContainer belowSubview:topBarViewController.view];
    beerFrameContainer.alpha = 0.0;
    [[beerFrameContainer layer] setRasterizationScale:0.6];
    beerButton.alpha = 0.2;
    
    [UIView animateWithDuration:2.0 animations:^{

        beerFrameContainer.alpha = 1.0;
        beerButton.alpha = 0;
        
        [[beerFrameContainer layer] setRasterizationScale:1.0];
        [[beerFrameContainer layer] setShouldRasterize:YES];
        
        
	} completion:^(BOOL finished)
	 {
         [beerButton setHidden:YES];
     }];
    
}

-(IBAction)backAction:(id)sender{
    isShowBeerButton = YES;
    [beerFrameContainer removeFromSuperview];
    [self showBeerButton];
}

- (void) showBeerButton{

    beerButton.alpha = 0.3;
    [beerButton setHidden:NO];
    [UIView animateWithDuration:1.0 animations:^{
        beerButton.alpha = 1.0;
        
	} ];
}

- (void) showBeerFrameContainer{
    beerFrameContainer.alpha = 0.3;
    [beerFrameContainer setHidden:NO];
    [UIView animateWithDuration:1.0 animations:^{
        beerFrameContainer.alpha = 1.0;
	} ];
}
- (void) show{
    if (isShowBeerButton) {
        [self showBeerButton];
    }else
        [self showBeerFrameContainer];
}

#pragma mark - View lifecycle
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    topBarViewController = [TopBarViewController sharedInstance];
    topBarViewController.view.contentMode = UIViewContentModeTop;
    [self.view addSubview:topBarViewController.view];
    [self show];
    
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
