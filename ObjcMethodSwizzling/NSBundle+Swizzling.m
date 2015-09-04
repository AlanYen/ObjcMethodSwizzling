//
//  NSBundle+Swizzling.m
//  17Life
//
//  Created by Alan.Yen on 2015/9/4.
//  Copyright (c) 2015年 17Life All rights reserved.
//

#import "NSBundle+Swizzling.h"
#import <objc/runtime.h>

@implementation NSBundle (Swizzling)

+ (void)load {
    
    //
    // 參考 http://nshipster.com/method-swizzling/
    //

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = @selector(pathForResource:ofType:);
        SEL swizzledSelector = @selector(xxx_pathForResource:ofType:);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
        // When swizzling a class method, use the following:
        // Class class = object_getClass((id)self);
        // ...
        // Method originalMethod = class_getClassMethod(class, originalSelector);
        // Method swizzledMethod = class_getClassMethod(class, swizzledSelector);
        
        BOOL didAddMethod =
        class_addMethod(class,
                        originalSelector,
                        method_getImplementation(swizzledMethod),
                        method_getTypeEncoding(swizzledMethod));
        
        if (didAddMethod) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

#pragma mark -
#pragma mark - [Method Swizzling]

- (NSString *)xxx_pathForResource:(NSString *)name ofType:(NSString *)ext {
    
    //
    // 參考 http://nshipster.com/method-swizzling/
    //
    
    return [self xxx_pathForResource:name ofType:ext];
}

@end
