//
//  RouterCell.m
//  RouterResponder
//
//  Created by 何发松 on 2016/12/5.
//  Copyright © 2016年 HeRay. All rights reserved.
//

#import "RouterCell.h"


@interface RouterCell (){
    NSDictionary *currentValues;
}
@property (weak, nonatomic) IBOutlet UILabel *textLable;

@end

@implementation RouterCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
}

- (IBAction)didCheckButtonAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    NSString *eventName = sender.selected ? @"add" : @"delete";
    [sender routerWithEventName:eventName userInfo:currentValues];
}

- (void)setTitleValues:(NSDictionary *)values{
    _textLable.text = [values objectForKey:@"value"];
    currentValues = values;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
