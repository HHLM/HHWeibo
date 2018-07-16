//
//  NSObject+Ext.m
//  HHWeiBo
//
//  Created by Mac on 2018/7/12.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import "NSObject+Ext.h"
#import <objc/runtime.h>

/**
 runtime的运行机制 OC是一门动态语言把静态的方法和编译放到运行时中 达到动态编译的效果
 写代码的时候更灵活，比如可以把消息转发给想要的对象  交换方法等
 C编译的时候就决定调用哪个函数 而OC只有在运行的时候才会根据函数名称找到对应函数调用
 在编译阶段 OC可以调用任何函数 只有声明就不会报错  C必须要实现否者报错
 */

@implementation NSObject (Ext)

- (void)encode:(NSCoder *)aCoder {
    Class c = self.class;
    while (c && c != [NSObject class]) {
        
        unsigned int count = 0;
        
        Ivar *ivars = class_copyIvarList(self.class, &count);
        for (int i = 0; i < count; i ++) {
            Ivar ivar = ivars[i];
            NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoreNames)]) {
                if ([[self ignoreNames] containsObject:ivarName]) {
                    continue;
                }
            }
            
            id value = [self valueForKey:ivarName];
            [aCoder encodeObject:value forKey:ivarName];
        }
        
        free(ivars);
        
        c = [c superclass];
        
    }
}

- (void)decode:(NSCoder *)aDecoder {
    Class c = self.class;
    
    while (c && c != [NSObject class]) {
        
        unsigned int count = 0;
        
        Ivar *ivars = class_copyIvarList(self.class, &count);
        
        for (int i = 0; i < count; i ++) {
           
            Ivar ivar = ivars[i];
            
            NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
            
            if ([self respondsToSelector:@selector(ignoreNames)]) {
                if ([[self ignoreNames] containsObject:ivarName]) {
                    continue;
                }
            }
            
            id value = [aDecoder decodeObjectForKey:ivarName];
            
            [self setValue:value forKey:ivarName];
            
        }
        
        free(ivars);
        
        c = [c superclass];
        
    }
}

- (NSArray *)ignoreNames {
    
    return @[@""];
}

@end
