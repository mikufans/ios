//
//  plus.m
//  helloios
//
//  Created by WL-DZ-PGDN-007 on 14-11-26.
//  Copyright (c) 2014年 Mac-Yang. All rights reserved.
//

#import "plus.h"

@interface plus ()

@end

@implementation plus

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    CGRect status = [[UIApplication sharedApplication] statusBarFrame];
    CGFloat statusheight = status.size.height;//状态栏的高度
    CGFloat statuswidth = status.size.width;//状态栏的宽度详单与屏幕宽度
    
    CGRect view = [UIScreen mainScreen].bounds;
    CGFloat viewheight = view.size.height;
    //CGFloat width = re.size.width;
    CGFloat height = viewheight - statusheight;
    self.lab = [[UILabel alloc]initWithFrame:CGRectMake(0, statusheight+height/25*8/2, statuswidth, height/25*8/2-1)];
    self.lab.backgroundColor = [UIColor darkGrayColor];
    self.lab.textColor = [UIColor whiteColor];
    self.lab.textAlignment = NSTextAlignmentRight;
    self.lab.font = [UIFont systemFontOfSize:40];
    self.lab.text = @"0";//数字值
    [self.view addSubview:_lab];
    CGFloat buttonheight = height/20*3;
    CGFloat buttonwidth = statuswidth/4;
    //旧的循环数字
//  int num = 0;
//    for (int i=1; i<10; i++) {
//        int y = i%3;
//        if(y == 0){
//            y = 3;
//        }
//        self.btn = [UIButton buttonWithType:UIButtonTypeCustom];//如果想给图片设置背景颜色要用custom类型
//        self.btn.frame = CGRectMake(num*buttonwidth, height/25*8+statusheight+buttonheight*(y-1), buttonwidth-1, buttonheight-1);
//        [self.btn setTintColor:[UIColor whiteColor]];//设置文字颜色
//        [self.btn setBackgroundColor:[UIColor darkGrayColor]];
//        [self.btn setTitle:[NSString stringWithFormat:@"%d",i] forState:UIControlStateNormal];
//        [self.view addSubview:_btn];
//        if (y == 3) {
//            num++;
//        }
//    }
    //处理数字按钮 新的循环数组
    NSArray *numarray = [NSArray arrayWithObjects:@"0",@".",@"",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9" ,nil];
    int num=0,y = 0;
    for (NSString *val in numarray) {
        int x = num%3;
        if(x == 0){
            y++;
        }
        NSLog(@"x:%i,y:%i",x,y);
        if ([val isEqualToString:@""]) {
            num++;
            continue;
        }
        self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];//如果想给图片设置背景颜色要用一些特定类型 好像是RoundedRect custom类型
        self.btn.frame = CGRectMake(x*buttonwidth, statusheight+height/25*8+buttonheight*(4-y), buttonwidth-1, buttonheight-1);
        [self.btn setTintColor:[UIColor whiteColor]];//设置文字颜色
        [self.btn setBackgroundColor:[UIColor darkGrayColor]];
        [self.btn setTitle:[NSString stringWithFormat:@"%@",val] forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(getNum:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
        num++;
    }
    
    //处理计算按钮
    NSArray *plusarray = [NSArray arrayWithObjects:@"+",@"-",@"*",@"/",@"=", nil];//声明一个array数组 结尾必须带个nil
    int up = 1;
    for (NSString *val in plusarray) {
        self.btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];//如果想给图片设置背景颜色要用custom类型
        if ([val isEqualToString:@"="]) {//比较字符串是否相等 不等怎么打
            NSLog(@"i am in");
             self.btn.frame = CGRectMake(statuswidth-buttonwidth*2, height/25*8+statusheight+buttonheight*(up-2), buttonwidth-1, buttonheight-1);
        }else{
             self.btn.frame = CGRectMake(statuswidth-buttonwidth, height/25*8+statusheight+buttonheight*(up-1), buttonwidth-1, buttonheight-1);
        }

        [self.btn setTintColor:[UIColor whiteColor]];//设置文字颜色
        [self.btn setBackgroundColor:[UIColor orangeColor]];
        [self.btn setTitle:[NSString stringWithFormat:@"%@",val] forState:UIControlStateNormal];
        [self.btn addTarget:self action:@selector(go:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_btn];
        up++;
    }
    
    
    
    //加入我的信息
    UILabel *myinfo = [[UILabel alloc]initWithFrame:CGRectMake(0, statusheight+height/100*92, statuswidth, height/100*8)];
    [myinfo setBackgroundColor:[UIColor blackColor]];
    myinfo.text = @"producer@chenhui";
    myinfo.textAlignment = NSTextAlignmentCenter;
    myinfo.textColor = [UIColor whiteColor];
    [self.view addSubview:myinfo];
    
    
    self.string = [[NSMutableString alloc]init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) getNum:(id) sender{
    [self.string appendString:[sender currentTitle]];
    self.lab.text = self.string;
    self.num1 = [self.lab.text doubleValue];
    NSLog(@"%f",self.num1);
}

-(void) go:(id) sender{
    // 如果为空是第一次处理
    BOOL ok = YES;
    NSLog(@"mystring%@",self.string);
    if(self.plus != nil){
        if ([self.string isEqualToString:@""]) {
            if ([[sender currentTitle] isEqualToString:@"="]) {
                ok = YES;
            }else{
                ok = NO;
            }
        }else{
            ok = YES;
        }
        if(ok){
            if ([self.plus isEqualToString:@"+"]) {
                self.num2 = self.num2+self.num1;
            }else if ([self.plus isEqualToString:@"-"]) {
                self.num2 = self.num2-self.num1;
            }else if ([self.plus isEqualToString:@"*"]) {
                self.num2 = self.num2*self.num1;
            }else if ([self.plus isEqualToString:@"/"]) {
                self.num2 = self.num2/self.num1;
            }
        }
    }else{
        self.num2 = self.num1;//设置俩个值相等
    }
    if ([[sender currentTitle] isEqualToString:@"="]) {
        //self.plus = [sender currentTitle];
    }else{
        self.plus = [sender currentTitle];
    }
    //类的方法调用 [self 方法名称];
    self.lab.text = [self changeFloat:[NSString stringWithFormat:@"%f",self.num2]];
    //self.lab.text = [NSString stringWithFormat:@"%.3f",self.num2];
    [self.string setString:@""];
    //self.string = @"";这样是不行的
    NSLog(@"%f,%f,%@",self.num1,self.num2,self.plus);
    //如果为0取整数
    //记录的时候如果连续点运算符要停止一次运算
    //label字体布局
}

//网上找的去掉后面空0的方法
-(NSString *)changeFloat:(NSString *)stringFloat
{
    const char *floatChars = [stringFloat UTF8String];
    NSUInteger length = [stringFloat length];
    NSUInteger zeroLength = 0;
    int i = length-1;
    for(; i>=0; i--)
    {
        if(floatChars[i] == '0'/*0x30*/) {
            zeroLength++;
        } else {
            if(floatChars[i] == '.')
                i--;
            break;
        }
    }
    NSString *returnString;
    if(i == -1) {
        returnString = @"0";
    } else {
        returnString = [stringFloat substringToIndex:i+1];
    }
    return returnString;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
