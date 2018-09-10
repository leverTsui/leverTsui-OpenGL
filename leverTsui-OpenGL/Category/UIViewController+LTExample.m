//
//  UIViewController+LTExample.m
//  leverTsui-OpenGL
//
//  Created by xulihua on 2018/9/10.
//  Copyright © 2018年 huage. All rights reserved.
//

#import "UIViewController+LTExample.h"
#import <objc/runtime.h>

static char MethodKey;

@implementation UIViewController (LTExample)


- (void)setMethod:(NSString *)method {
    objc_setAssociatedObject(self, &MethodKey, method, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)method {
    return objc_getAssociatedObject(self, &MethodKey);
}

@end
