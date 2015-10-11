//
//  TabVC.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import "TabVC.h"

@implementation TabVC

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
//    NSArray *items= self.tabBar.items;
//    [items[0] setSelectedImage:[UIImage imageNamed:@"givings_icon"]];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    UITabBar *tabBar=self.tabBar;
    UITabBarItem *tabBarItem1 = [tabBar.items objectAtIndex:0];
//    UITabBarItem *tabBarItem2 = [tabBar.items objectAtIndex:1];
//    UITabBarItem *tabBarItem3 = [tabBar.items objectAtIndex:2];
    
    
    //Setting the tab bar item image
    tabBarItem1.selectedImage = [[UIImage imageNamed:@"test_icon"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    tabBarItem1.image = [UIImage imageNamed:@"test_icon_highlight"];
    
//    tabBarItem2.selectedImage = [[UIImage imageNamed:@"icon_64_message_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    tabBarItem2.image = [UIImage imageNamed:@"icon_64_message"];
//    
//    tabBarItem3.selectedImage = [[UIImage imageNamed:@"icon_64_profile_highlight"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    tabBarItem3.image = [UIImage imageNamed:@"icon_64_profile"];
    

}

@end
