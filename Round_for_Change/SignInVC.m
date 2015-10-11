//
//  SignInVC.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import "MySegue.h"
#import "SignInVC.h"

@interface SignInVC ()

@property (weak, nonatomic) IBOutlet UIButton *transparentBtn;

@end

@implementation SignInVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.transparentBtn.alpha = 0;
//    self.navigationController.navigationBarHidden=NO;
    
//    UIImageView *backgroundImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sign_in_bg"]];
//    backgroundImage.contentMode = UIViewContentModeScaleAspectFill;
//    
//    [self.view addSubview:backgroundImage];
//    [self.view sendSubviewToBack:backgroundImage];
}

// Prepare for the segue going forward
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue isKindOfClass:[MySegue class]]) {
        // Set the start point for the animation to center of the button for the animation
        ((MySegue *)segue).originatingPoint = self.transparentBtn.center;
    }
}
@end
