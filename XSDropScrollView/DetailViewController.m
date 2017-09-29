//
//  DetailViewController.m
//  TestProject
//
//  Created by iOS－Dev on 2017/6/7.
//  Copyright © 2017年 iOS－Dev. All rights reserved.
//

#import "DetailViewController.h"
#import "Define.h"
#import "MyControl.h"

#define URL @"http://51wentou.com/index/tips"
@interface DetailViewController ()<UIScrollViewDelegate>

/**
 首页视图
 */
@property (nonatomic, strong) UIScrollView *firstScrollView;

/**
 上拉视图
 */
@property (nonatomic, strong) UIView *footView;

/**
 上拉箭头
 */
@property (nonatomic, strong) UIImageView *footArrowView;

/**
 上拉文字
 */
@property (nonatomic, strong) UILabel *footLabel;

/**
 下拉视图
 */
@property (nonatomic, strong) UIView *headView;
/**
 下拉箭头
 */
@property (nonatomic, strong) UIImageView *headArrowView;

/**
 下拉文字
 */
@property (nonatomic, strong) UILabel *headLabel;

/**
 详情页
 */
@property (nonatomic, strong) UIView *secondView;

/**
 详情页scrollView
 */
@property (nonatomic, strong) UIWebView *secondScrollView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self createUI];
}

- (void)createUI{
    
    self.title = @"testProduct";
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.firstScrollView];
    [self.view addSubview:self.secondView];
    
}

- (UIScrollView *)firstScrollView{
    if (!_firstScrollView) {
        _firstScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64, KScreenWidth, KScreenHeight-64)];
        _firstScrollView.backgroundColor = KColorRGB(200, 160, 110);
        _firstScrollView.contentSize = CGSizeMake(0, KScreenHeight);
        _firstScrollView.pagingEnabled = YES;
        _firstScrollView.showsVerticalScrollIndicator = NO;
        _firstScrollView.showsHorizontalScrollIndicator = NO;
        _firstScrollView.delegate = self;
        
#ifdef __IPHONE_11_0
        if ([_firstScrollView respondsToSelector:@selector(setContentInsetAdjustmentBehavior:)]) {
            _firstScrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
        }
#endif
        
        UILabel *label = [MyControl labelWithTitle:@"firstView" fram:CGRectMake(0, 200, KScreenWidth, 40) fontOfSize:20];
        label.textAlignment = NSTextAlignmentCenter;
        [_firstScrollView addSubview:label];
        
        [_firstScrollView addSubview:self.footView];
    }
    return _firstScrollView;
}

- (UIView *)footView{
    if (!_footView) {
        _footView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight-60-64, KScreenWidth, 40)];
        
        _footArrowView = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth-200)/2, 10, 15, 20)];
        _footArrowView.image = [UIImage imageNamed:@"pullArrow"];
        [_footView addSubview:_footArrowView];
        
        _footLabel = [MyControl labelWithTitle:@"上拉查看详情" fram:CGRectMake((KScreenWidth-200)/2+50, 0, 150, 40) fontOfSize:14];
        [_footView addSubview:_footLabel];
        
    }
    return _footView;
}

- (UIView *)headView{
    
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, -40, KScreenWidth, 40)];
        
        _headArrowView = [[UIImageView alloc]initWithFrame:CGRectMake((KScreenWidth-200)/2, 10, 15, 20)];
        _headArrowView.image = [UIImage imageNamed:@"pullArrow"];
        _headArrowView.transform = CGAffineTransformMakeRotation(M_PI);
        [_headView addSubview:_headArrowView];
        
        self.headLabel = [MyControl labelWithTitle:@"下拉回到首页" fram:CGRectMake((KScreenWidth-200)/2+50, 0, 150, 40) fontOfSize:14];
        [_headView addSubview:self.headLabel];
        
    }
    return _headView;
}

- (UIView *)secondView{
    
    if (!_secondView) {
        _secondView = [[UIView alloc]initWithFrame:CGRectMake(0, KScreenHeight+20, KScreenWidth, KScreenHeight)];
        _secondView.backgroundColor = KColorRGB(241, 241, 241);
        
        UILabel *label = [MyControl labelWithTitle:@"项目详细" fram:CGRectMake(0, 0, KScreenWidth, 50) fontOfSize:17];
        label.textAlignment = NSTextAlignmentCenter;
        label.backgroundColor = [UIColor whiteColor];
        
        [_secondView addSubview:self.secondScrollView];
        [_secondView addSubview:label];
    }
    return _secondView;
}

- (UIWebView *)secondScrollView{
    
    if (!_secondScrollView) {
        _secondScrollView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 51, KScreenWidth, KScreenHeight-51-64)];
        _secondScrollView.backgroundColor = KColorRGB(192, 192, 192);
        [_secondScrollView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:URL]]];
        _secondScrollView.scrollView.delegate = self;
        
        [_secondScrollView.scrollView addSubview:self.headView];
    }
    return _secondScrollView;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

    NSLog(@"didscroll");
    CGFloat y = scrollView.contentOffset.y;
    
    if (scrollView == _firstScrollView) {
        
        self.secondView.transform = CGAffineTransformMakeTranslation(0, -y);
        if (y < 60) {
            self.footLabel.text = @"上拉查看详情";
            self.footArrowView.transform = CGAffineTransformIdentity;
        }else{
            self.footLabel.text = @"松开查看详情";
            self.footArrowView.transform = CGAffineTransformMakeRotation(M_PI);
        }
    }
    
    if ([scrollView isEqual:_secondScrollView.scrollView]) {
        
        CGAffineTransform transform = CGAffineTransformIdentity;
        
        if (y < -60) {
            
            self.headLabel.text = @"松开回到首页";
        }else {
            transform = CGAffineTransformMakeRotation(M_PI);
            self.headLabel.text = @"下拉回到首页";
        }
        
        self.headArrowView.transform = transform;
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    CGFloat y = scrollView.contentOffset.y;
    
    if ([scrollView isEqual:_firstScrollView]) {
        if (y > 60){
            [self transformToSecondView];

        }
    }
    
    if ([scrollView isEqual:_secondScrollView.scrollView]) {
        
        if (y < -60) {
            [self transformToFirstView];
        }
        
    }
}

- (void)transformToSecondView{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect1 = _firstScrollView.frame;
        CGRect rect2 = _secondView.frame;
        
        rect1.origin.y = -KScreenHeight;
        rect2.origin.y = 0;
        
        self.firstScrollView.frame = rect1;
        self.secondView.frame = rect2;
        
    } completion:^(BOOL finished) {
        self.footArrowView.transform = CGAffineTransformIdentity;
        self.footLabel.text = @"上拉查看详情";
    }];
}

- (void)transformToFirstView{
    [UIView animateWithDuration:0.5 animations:^{
        CGRect rect1 = _firstScrollView.frame;
        CGRect rect2 = _secondView.frame;
        
        rect1.origin.y = 64;
        rect2.origin.y = KScreenHeight+20;
        
        self.firstScrollView.frame = rect1;
        self.secondView.frame = rect2;
        
    } completion:^(BOOL finished) {
        self.headArrowView.transform = CGAffineTransformIdentity;
        self.headLabel.text = @"下拉回到首页";
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
