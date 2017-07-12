//
//  TableViewController.m
//  AZContact
//
//  Created by Lenin on 11/07/17.
//  Copyright © 2017 lworld. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AtoZArray = [@"A B C D E F G H I J K L M N O P Q R S T U V W X Y Z" componentsSeparatedByString:@" "];
    nameDict = @{@"A" : @[@"Alia Jsoeph", @"Alex Mia", @"Aji Vargheese",@"Amar Ali",@"Asru Khan"],
                @"C" : @[@"Caira katia", @"Cook"],
                @"D" : @[@"Daniel", @"Don"],
                @"E" : @[@"Emirates"],
                @"G" : @[@"Gira", @"George",@"Giima"],
                @"H" : @[@"Hispa", @"Hina"],
                @"K" : @[@"Koala"],
                @"L" : @[@"Lee", @"Llama"],
                @"M" : @[@"Mia", @"Max"],
                @"P" : @[@"Panda", @"Pistol", @"Peter", @"Peego", @"Polar"],
                @"R" : @[@"Racheal"],
                @"S" : @[@"Seague"],
                @"T" : @[@"Tasmania"],
                @"W" : @[@"Whale", @"White", @"Woo"]};
    nameArr = [[nameDict allKeys] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [nameArr count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[nameDict objectForKey:[nameArr objectAtIndex:section]] count];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return AtoZArray;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return [nameArr objectAtIndex:section];
}

 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
     cell.textLabel.text = [[nameDict objectForKey:[nameArr objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
     [_refrshControl endRefreshing];
     return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //add code here for call button.
    }
}
-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"Call";
}

- (IBAction)refreshControlAction:(id)sender {
    (void)self.tableView.reloadData;
}

- (IBAction)handleLongPress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan){
        CGPoint p = [sender locationInView:self.tableView];
        NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:p];
        NSString *message;
        if (indexPath == nil) {
            message=@"long press on table view but not on a row";
        } else {
            message = [NSString stringWithFormat:@"long press on table view at section %d row %d", indexPath.section, indexPath.row];
        }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"AZContact"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    [alert show];
    }

}

@end
