//
//  tableViewCell.h
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface tableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *textView;

@property(weak,nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
