//
//  NSObject+Ext.h
//  HHWeiBo
//
//  Created by Mac on 2018/7/12.
//  Copyright © 2018年 Mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Ext)

- (void)encode:(NSCoder *)aCoder;
- (void)decode:(NSCoder *)aDecoder;

@end
