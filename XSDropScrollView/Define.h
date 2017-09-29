//
//  Define.h
//  TestProject
//
//  Created by iOS－Dev on 16/10/20.
//  Copyright © 2016年 iOS－Dev. All rights reserved.
//
#import <UIKit/UIKit.h>
#ifndef Define_h
#define Define_h

#define KScreenWidth [UIScreen mainScreen].bounds.size.width

#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#define KColorRGBA(r,g,b,a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

#define KColorRGB(r,g,b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]

#define KIPHONE6 [UIScreen mainScreen].bounds.size.width > 320?YES:NO
UIKIT_EXTERN const CGFloat TestX;
UIKIT_EXTERN CGFloat const TestY;
UIKIT_EXTERN NSString *const TestString;

#define KTest [[[NSUserDefaults standardUserDefaults]objectForKey:@"test"]isEqualToString:@"test"]?@"test":@"local"

/** 网络请求方式*/
#define KPOST @"post"
#define KGET @"get"
#define KPUT @"put"


#endif /* Define_h */
