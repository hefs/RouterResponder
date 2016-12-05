//
//  ViewController.m
//  RouterResponder
//
//  Created by 何发松 on 2016/12/5.
//  Copyright © 2016年 HeRay. All rights reserved.
//

#import "ViewController.h"
#import "UIResponder+Router.h"
#import "RouterCell.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *values;
    NSMutableArray *selectedValues;
}
@property (weak, nonatomic) IBOutlet UILabel *lblResult;
@property (weak, nonatomic) IBOutlet UITableView *layoutView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    selectedValues = [[NSMutableArray alloc] initWithCapacity:0];
    values = @[@{@"id":@"1",@"value":@"10元投资券"},
               @{@"id":@"2",@"value":@"20元投资券"},
               @{@"id":@"3",@"value":@"20元投资券"},
               @{@"id":@"4",@"value":@"30元投资券"},
               @{@"id":@"5",@"value":@"20元投资券"},
               @{@"id":@"6",@"value":@"10元投资券"}
               ];
    [_layoutView registerNib:[UINib nibWithNibName:NSStringFromClass([RouterCell class]) bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"Cell"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return values.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RouterCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setTitleValues:[values objectAtIndex:indexPath.row]];
    return cell;
}

- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo{
    id obj = [self containValuesWithID:[userInfo objectForKey:@"id"]];
    if (!obj && [eventName isEqualToString:@"add"]) {
        [selectedValues addObject:userInfo];
    }else if (obj && [eventName isEqualToString:@"delete"]){
        [selectedValues removeObject:obj];
    }
    NSMutableArray *tmpValues = [NSMutableArray arrayWithCapacity:0];
    for (NSDictionary *tmp in selectedValues) {
        [tmpValues addObject:[tmp objectForKey:@"value"]];
    }
    _lblResult.text = [tmpValues componentsJoinedByString:@"+"];
}

- (id)containValuesWithID:(NSString *)valueID{
    for (NSDictionary *tmpValue in selectedValues) {
        if ([valueID isEqualToString:[tmpValue valueForKey:@"id"]]) {
            return tmpValue;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
