//
//  MyCampaignsVC.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#define CELL_HEIGHT 250

#import "MyCampaignsVC.h"
#import "tableViewCell.h"
#import "Config.h"
#import "Campaign.h"

@interface MyCampaignsVC ()
@property(strong) NSArray *data;
@property NSData *responseData;
@property (strong,nonatomic) UIActivityIndicatorView *tableViewSpinner;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MyCampaignsVC

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
    self.tableView.layer.cornerRadius = 30.0;
    self.tableView.clipsToBounds=YES;
}

-(void)initFakeData{
    Campaign *c1 = [[Campaign alloc] initWithImage:[UIImage imageNamed:@"breast_cancer"] WithDesc:@"WE support Breast Cancer awareness, research and the celebration for survivors. We recently participated in the Breast Cancer Forum hosted by Ingalls Hospital of Chicago Heights, IL and the women of Zeta Phi Beta Sorority, Inc. " WithTitle:@"Breast Cancer Awareness"];
    Campaign *c2 = [[Campaign alloc] initWithImage:[UIImage imageNamed:@"breast_cancer"] WithDesc:@"WE support Breast Cancer awareness, research and the celebration for survivors. We recently participated in the Breast Cancer Forum hosted by Ingalls Hospital of Chicago Heights, IL and the women of Zeta Phi Beta Sorority, Inc. " WithTitle:@"Build My Album"];
    Campaign *c3 = [[Campaign alloc] initWithImage:[UIImage imageNamed:@"breast_cancer"] WithDesc:@"WE support Breast Cancer awareness, research and the celebration for survivors. We recently participated in the Breast Cancer Forum hosted by Ingalls Hospital of Chicago Heights, IL and the women of Zeta Phi Beta Sorority, Inc. " WithTitle:@"Community Garden"];
    self.data= [NSArray arrayWithObjects:c1,c2,c3,nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initFakeData];
    //    self.view.backgroundColor = NAV_BAR_BACKGROUND_COLOR;
    
    //Add a right button to navigation bar
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Show Popover" style:UIBarButtonItemStylePlain target:self action:@selector(showPopOver:)];
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    // setup the spinner
    if (self.data.count==0) {
        self.tableViewSpinner=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        [self.view addSubview:self.tableViewSpinner];
        [self.tableViewSpinner setCenter:CGPointMake(self.view.center.x, self.view.center.y*0.8)];
        [self.tableViewSpinner startAnimating];
        self.tableViewSpinner.hidesWhenStopped=YES;
    }
    
    // Create the request.
    NSURLRequest *request = [NSURLRequest requestWithURL:
                             [NSURL URLWithString:@"http://google.com"]];
    
    // Create url connection and fire request
    NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(highlightLetter:)];
    [self.view addGestureRecognizer:ges];
    
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
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"tableViewCell2" owner:self options:nil];
        cell = [nib objectAtIndex:0];
    }
    
    Campaign *c = (Campaign*)([self.data objectAtIndex:indexPath.row]);
    cell.titleLabel.text= c.title;
    cell.imageView.image=c.img;
    cell.textView.text=c.desc;
    
    // Remove seperator inset
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    // Prevent the cell from inheriting the Table View's margin settings
    if ([cell respondsToSelector:@selector(setPreservesSuperviewLayoutMargins:)]) {
        [cell setPreservesSuperviewLayoutMargins:NO];
    }
    // Explictly set cell's layout margins
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return CELL_HEIGHT;
}

/*Jump to profile page if a cell is clicked.*/
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    [self performSegueWithIdentifier:@"segue_list_to_campaign_display" sender:self];
//}

/*************************
 Navigation
 ************************/
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqual:@"segue_list_to_campaign_display"]){
        //Pass the data to display VC
    }
}

-(IBAction)prepareForUnwind:(UIStoryboardSegue *)segue{
    
}

-(IBAction)showPopOver:(UIBarButtonItem*)sender{
    //    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"maskView" owner:self options:nil];
    //    UIView *new_view = [nib objectAtIndex:0];
    //
    //    UIWindow* mainWindow = [[UIApplication sharedApplication] keyWindow];
    //    [mainWindow addSubview: new_view];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: [NSBundle mainBundle]];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"MaskVC"];
    [self presentViewController:viewController animated:YES completion:^(void){}];
}

-(IBAction)highlightLetter:(id)sender{
    [self performSegueWithIdentifier:@"segue_list_to_campaign_display" sender:self];
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    self.responseData = [[NSData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    self.responseData = data;
    //    NSLog(@"%@",data);
    [self.tableViewSpinner stopAnimating];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
}

@end
