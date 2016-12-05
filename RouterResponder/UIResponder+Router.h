//
//  UIResponder+Router.h
//  RouterResponder
//
//  Created by 何发松 on 2016/12/5.
//  Copyright © 2016年 HeRay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Router)
- (void)routerWithEventName:(NSString *)eventName userInfo:(NSDictionary *)userInfo;
@end
