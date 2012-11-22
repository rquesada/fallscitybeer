//
//  AppDelegate.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "LoadingViewController.h"
#import "HomeViewController.h"
#import "BeerViewController.h"
#import "BeerLocatorViewController.h"
#import "GalleryViewController.h"
#import "CalendarViewController.h"
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

@implementation AppDelegate
@synthesize window = _window;
@synthesize tabBarController = _tabBarController;
@synthesize navController;
LoadingViewController *loadingViewController;
HomeViewController *homeViewController;
BeerViewController *beerViewController;
BeerLocatorViewController *beerLocatorViewController;
GalleryViewController *galleryViewController;
CalendarViewController *calendarViewController;

- (Boolean) Navigate: (NSString*)viewName{
    
    
    if ([viewName isEqual:HOME_VIEW]){
        self.window.rootViewController = self.tabBarController;
//        [self setUINavigationBarTitle:@"My Stats"];        
//        [self.navController pushViewController:myStats animated:YES];
        
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    NSLog(@"launched");
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    homeViewController = [[HomeViewController alloc] initWithNibName:@"Home" bundle:[NSBundle mainBundle]];
    beerViewController = [[BeerViewController alloc] initWithNibName:@"Beer" bundle:[NSBundle mainBundle]];
    beerLocatorViewController = [[BeerLocatorViewController alloc] initWithNibName:@"BeerLocator" bundle:[NSBundle mainBundle]];
    galleryViewController = [[GalleryViewController alloc] initWithNibName:@"Gallery" bundle:[NSBundle mainBundle]];

    self.tabBarController = [[UITabBarController alloc] init];
        self.tabBarController.delegate = self;
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:homeViewController, 
                                             beerViewController,
                                             beerLocatorViewController,
                                             galleryViewController, nil];

       

    //Tab bar
    [[[self tabBarController] tabBar] setBackgroundImage:[UIImage imageNamed:@"tabbarbackground_2.png"]];
    [[[self tabBarController] tabBar] setSelectedImageTintColor:[UIColor colorWithRed:94.0/255.0 green:102.0/255.0 blue:114.0/255.0 alpha:1.0]];
    [[[self tabBarController] tabBar] setSelectionIndicatorImage:[UIImage imageNamed:@"itemTabBarSelected.png"]];
//    for(UIViewController *tab in  self.tabBarController.viewControllers)
//        
//    {        
//        [tab.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
//                                                [UIFont boldSystemFontOfSize:13.0], UITextAttributeFont, nil]
//                                      forState:UIControlStateNormal];
//    }
    
    loadingViewController = [[LoadingViewController alloc] initWithNibName:@"Loading" bundle:[NSBundle mainBundle]];
//    [self.window addSubview:self.tabBarController.view];
    [self.window addSubview:loadingViewController.view];
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

#pragma mark -
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}


// Optional UITabBarControllerDelegate method.
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    if ([tabBarController.selectedViewController.title isEqualToString:@"Home"] && [homeViewController.animationStatus isEqualToString:ANIMATION_CAN_START]) {
        [homeViewController startAnimation];
        
        if ([viewController.title isEqualToString:@"Beer"]) {
//            [beerViewController show];
        }
        
        return NO;
    }
    
    
    return YES;
}
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"didSelectViewController tabbar");
}

// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed{
    NSLog(@"dissmised tabbar");
}


@end
