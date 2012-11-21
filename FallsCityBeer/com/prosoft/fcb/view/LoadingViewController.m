//
//  LoadingViewController.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/20/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoadingViewController.h"

@implementation LoadingViewController
@synthesize rightImage,leftImage,rightImageEffect,leftImageEffect;

AppDelegate *appDelegate;

- (void) inits{
    appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self inits];
    }
    return self;
}


- (void) goHome{
    [appDelegate Navigate:HOME_VIEW];
    
}

- (void) animationHide{
    [leftImage setHidden:YES];
    [rightImage setHidden:YES];
    
    [UIView animateWithDuration:1.2 animations:^{
        leftImage.transform = CGAffineTransformMakeTranslation(-160,0);
        leftImage.alpha = 0.3;
        rightImage.transform = CGAffineTransformMakeTranslation(320,0);
        rightImage.alpha = 0.3;
        
        rightImageEffect.transform = CGAffineTransformMakeTranslation(320,0);
        leftImageEffect.transform = CGAffineTransformMakeTranslation(-160,0);
        
        [[leftImage layer] setRasterizationScale:0.6];
        [[leftImage layer] setShouldRasterize:YES];
        
        [[rightImage layer] setRasterizationScale:0.6];
        [[rightImage layer] setShouldRasterize:YES];
        
	} completion:^(BOOL finished)
	 {
		 NSLog(@"animation end");
//         [[appDelegate tabBarController] setSelectedIndex:1];
//         leftImage.transform = CGAffineTransformMakeTranslation(0,0);
//         leftImage.alpha=1;
//         
//         rightImage.transform = CGAffineTransformMakeTranslation(0,0);
//         rightImage.alpha=1;
//         
//         
//         [[leftImage layer] setRasterizationScale:1];
//         [[leftImage layer] setShouldRasterize:YES];
//         
//         [[rightImage layer] setRasterizationScale:1];
//         [[rightImage layer] setShouldRasterize:YES];
         [self performSelector:@selector(goHome) withObject:nil afterDelay:2.0];
         
	 }];
}

#pragma mark - View lifecycle
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad{
    [super viewDidLoad];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(animationHide) userInfo:nil repeats:NO];
}


- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)didReceiveMemoryWarning{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
