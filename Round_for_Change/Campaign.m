//
//  Campaign.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import "Campaign.h"

@implementation Campaign

-(id)initWithImage:(UIImage*)img WithDesc:(NSString*)desc WithTitle:(NSString*)title{
    if(self==[super init]){
        self.img= img;
        self.desc=desc;
        self.title=title;
    }
    return self;
}

@end
