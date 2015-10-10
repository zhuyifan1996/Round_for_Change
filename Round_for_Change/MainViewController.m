//
//  ViewController.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#define CELL_HEIGHT 100

#import "MainViewController.h"
#import "tableViewCell.h"

@interface MainViewController ()
@property(strong) NSArray *data;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.data = [NSArray arrayWithObjects:@"haha",@"bite me", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*************************
 Table view config
 ************************/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    
    tableViewCell *cell = (tableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil)
    {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"tableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    cell.titleLabel.text=[self.data objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
    heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}

/*Jump to profile page if a cell is clicked.*/
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self performSegueWithIdentifier:@"segue_list_to_campaign_display" sender:self];
}

/*************************
 Navigation
 ************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqual:@"segue_list_to_campaign_display"]){
        //Pass the data to display VC
    }
}

@end
