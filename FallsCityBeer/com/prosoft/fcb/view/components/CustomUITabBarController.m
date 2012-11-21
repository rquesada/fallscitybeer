//
//  CustomUITabBarController.m
//  FallsCityBeer
//
//  Created by Roy Quesada on 4/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CustomUITabBarController.h"

@implementation CustomUITabBarController
@synthesize tabBar1;

- (void)viewDidLoad {
    [super viewDidLoad];
    tabBar1.backgroundColor = [UIColor clearColor];
    CGRect frame = CGRectMake(0, 0, 480, 49);
    UIView *v = [[UIView alloc] initWithFrame:frame];
    UIImage *i = [UIImage imageNamed:@"tabBarBackground.png"];
    UIColor *c = [[UIColor alloc] initWithPatternImage:i];
    v.backgroundColor = c;
    [[self tabBar] insertSubview:v atIndex:0];
}
@end
