//
//  BeerViewController.h
//  FallsCityBeer
//
//  Created by Roy Quesada on 2/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopBarViewController.h"
#import "AppDelegate.h"

@interface BeerViewController : UIViewController <UITabBarControllerDelegate>{
    UIView *beerFrameContainer;
    TopBarViewController *topBarViewController;
    AppDelegate *appDelegate;
}
@property (nonatomic, retain) IBOutlet UIButton *beerButton;
@property (nonatomic, retain) IBOutlet UIButton *backButton;
@property (nonatomic, retain) IBOutlet UIView *beerFrameContainer;
@end
