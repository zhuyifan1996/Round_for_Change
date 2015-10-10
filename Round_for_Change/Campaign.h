//
//  Campaign.h
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Campaign : NSObject

@property(strong) UIImage *img;
@property(strong) NSString *desc;
@property(strong) NSString *title;

-(id)initWithImage:(UIImage*)img WithDesc:(NSString*)desc WithTitle:(NSString*)title;

@end
