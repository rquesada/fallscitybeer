//
//  AppDelegate.h
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "CustomUITabBarController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate, UITabBarControllerDelegate,UINavigationControllerDelegate>{
    UINavigationController *navController;
}

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (nonatomic, retain) UINavigationController *navController;

- (Boolean) Navigate: (NSString*)viewName;

@end
