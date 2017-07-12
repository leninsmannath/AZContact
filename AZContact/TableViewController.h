//
//  TableViewController.h
//  AZContact
//
//  Created by Lenin on 11/07/17.
//  Copyright © 2017 lworld. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
{
    NSArray *AtoZArray;
    NSDictionary *nameDict;
    NSArray *nameArr;
}
- (IBAction)refreshControlAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIRefreshControl *refrshControl;

@end
