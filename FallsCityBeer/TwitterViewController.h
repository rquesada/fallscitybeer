//
//  TwitterViewController.h
//  FallsCityBeer
//
//  Created by Edel  Aguero M on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TwitterCellViewController.h"

@interface TwitterViewController : UIViewController {

    NSArray *tweets;
    UITableView *tview;
    NSInteger tconts;
    
}

@property (weak, nonatomic) IBOutlet UITableView *tableview;



// get twitter from twitter page
- (BOOL) getTwitters;

- (void) hide;
@end
