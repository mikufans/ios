//
//  plus.h
//  helloios
//
//  Created by WL-DZ-PGDN-007 on 14-11-26.
//  Copyright (c) 2014年 Mac-Yang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface plus : UIViewController

@property (retain,nonatomic) UIButton *btn;//view上的按钮
@property (retain,nonatomic) UILabel *lab;//view上的计算器显示
@property (retain,nonatomic) NSMutableString *string;//可变的字符串，用来给label赋值显示结果
@property (assign,nonatomic) double num1,num2;//俩个进行运算的值
@property (assign,nonatomic) NSString *plus;

@end
