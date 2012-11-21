//
//  TwitterViewController.m
//  FallsCityBeer
//
//  Created by Edel  Aguero M on 31/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TwitterViewController.h"

@interface TwitterViewController ()

@end

@implementation TwitterViewController
@synthesize tableview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (BOOL) getTwitters{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        NSData* data = [NSData dataWithContentsOfURL: 
//                        [NSURL URLWithString: @"https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=edel_aguero&count=3"]];
        NSData* data = [NSData dataWithContentsOfURL: 
        [NSURL URLWithString: @"https://api.twitter.com/1/statuses/user_timeline.json?include_entities=true&include_rts=true&screen_name=fallscitybeer&count=20"]];

        
        NSError* error;
        
        tweets = [NSJSONSerialization JSONObjectWithData:data
                                                 options:kNilOptions 
                                                   error:&error];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableview reloadData];
        }); 
    });

    // NSMutableString* aString = [NSMutableString stringWithFormat:@"String with one int %d", tconts];
   // NSLog(aString);
       
    return YES;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    tconts = tweets.count;
    NSLog(@"count=%i", tconts);
    return tweets.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CellTwitter";
    
    TwitterCellViewController *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"twitterCells" owner:nil options:nil];
		
        for (id currentObject in topLevelObjects)
		{
			if ([currentObject isKindOfClass:[UITableViewCell class]]) {
				cell = (TwitterCellViewController *) currentObject; 
				break;
			}
		}
    }
    
    NSDictionary *tweet = [tweets objectAtIndex:indexPath.row];    
    NSString *text = [tweet objectForKey:@"text"];
    NSString *name = [[tweet objectForKey:@"user"] objectForKey:@"name"];
    
    
    cell.userText.text = text;
    cell.userName.text = [@"@" stringByAppendingString:name];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSString *imageUrl = [[tweet objectForKey:@"user"] objectForKey:@"profile_image_url"];
        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageUrl]];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.userImage.image = [UIImage imageWithData:data];
        });
    });
    
    return cell;
}


- (void) hide{
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [self getTwitters];
}

- (void)viewDidUnload
{
    [self setTableview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
