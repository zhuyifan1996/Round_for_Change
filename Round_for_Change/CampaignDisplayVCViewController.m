//
//  CampaignDisplayVCViewController.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import "CampaignDisplayVCViewController.h"
#import "Config.h"

@interface CampaignDisplayVCViewController ()
@property (weak, nonatomic) IBOutlet UIButton *support_btn;
@end

@implementation CampaignDisplayVCViewController

-(UIImage *)imageFromColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden=YES;
    
    [self.support_btn setBackgroundImage:[self imageFromColor:NAV_BAR_BACKGROUND_COLOR] forState:UIControlStateSelected];
    [self.support_btn setTitle:@"SUPPORT!" forState:UIControlStateSelected];
    self.support_btn.clipsToBounds =YES;
    self.support_btn.layer.cornerRadius = 5.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*Do something if user clicks support*/
-(IBAction)supportCampaign:(UIButton *)btn{
    
    if(!btn.selected){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Thank You"
                                                                       message:@"Thank you for your support in this campaign."
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK"
                                                                style:UIAlertActionStyleDefault
                                                              handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        
    }
    btn.selected=!btn.selected;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(IBAction)prepareForUnwind3:(UIStoryboardSegue *)segue{
    
}

@end
