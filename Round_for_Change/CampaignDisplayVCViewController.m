//
//  CampaignDisplayVCViewController.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import "CampaignDisplayVCViewController.h"

@interface CampaignDisplayVCViewController ()
@property (weak, nonatomic) IBOutlet UIButton *support_btn;
@end

@implementation CampaignDisplayVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden=NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*Do something if user clicks support*/
-(IBAction)supportCampaign:(UIButton *)btn{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Thank You"
                                message:@"Thank you for your support in this campaign."
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                    style:UIAlertActionStyleDefault
                                handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
