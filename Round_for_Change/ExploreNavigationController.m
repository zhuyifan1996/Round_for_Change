//
//  ExploreNavigationController.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import "ExploreNavigationController.h"

@implementation ExploreNavigationController

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self){
        self.tabBarItem.image = [UIImage imageNamed:@"test_icon_highlight"];
    }
    return self;
}

@end
