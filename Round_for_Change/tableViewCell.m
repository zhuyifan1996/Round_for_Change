//
//  tableViewCell.m
//  Round_for_Change
//
//  Created by Yifan Zhu on 10/10/15.
//  Copyright (c) 2015 FinTech. All rights reserved.
//

#import "tableViewCell.h"

@interface tableViewCell()

@end

@implementation tableViewCell

- (void)awakeFromNib {
    // Initialization code
    
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: [NSBundle mainBundle]];
    self.masterVC = [storyboard instantiateViewControllerWithIdentifier:@"MainViewController"];
    self.textView.userInteractionEnabled=NO;
    
    UITapGestureRecognizer *ges = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(highlightLetter:)];
    [self addGestureRecognizer:ges];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(IBAction)highlightLetter:(id)sender{
    [self.masterVC performSegueWithIdentifier:@"segue_list_to_campaign_display" sender:self.masterVC];
}

@end
