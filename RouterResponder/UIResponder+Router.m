//
//  UIResponder+Router.m
//  RouterResponder
//
//  Created by 何发松 on 2016/12/5.
//  Copyright © 2016年 HeRay. All rights reserved.
//

#import "UIResponder+Router.h"

@implementation UIResponder (Router)
- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo {
    if (self.nextResponder) {
        [[self nextResponder] routerWithEventName:eventName userInfo:userInfo];
    }
}
@end
