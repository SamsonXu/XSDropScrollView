//
//  MyLabel.h
//  MyFamily
//
//  Created by qianfeng on 16/3/17.
//  Copyright (c) 2016年 Motion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CommonCrypto/CommonDigest.h>

@interface MyControl : NSObject

//Label不含坐标
+ (UILabel *)labelWithTitle:(NSString *)title color:(UIColor *)color fontOfSize:(NSInteger)fontOfSize numberOfLine:(NSInteger)num;

//Label包含文字、坐标、字体
+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram fontOfSize:(NSInteger)fontOfSize;

//Label包含文字、坐标、字体、行数
+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram  fontOfSize:(NSInteger)fontOfSize numberOfLine:(NSInteger)num;

//Label包含文字、坐标、字体、颜色、行数
+ (UILabel *)labelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(NSInteger)fontOfSize numberOfLine:(NSInteger)num;

//粗体Label包含文字、坐标、字体
+ (UILabel *)boldLabelWithTitle:(NSString *)title fram:(CGRect)fram color:(UIColor *)color fontOfSize:(NSInteger)fontOfSize;

//imageView包含坐标、图片名
+ (UIImageView *)imageViewWithFram:(CGRect)fram imageName:(NSString *)imageName;

//imageView包含坐标、地址
+ (UIImageView *)imageViewWithFram:(CGRect)fram url:(NSString *)imageUrl;

//button包含坐标、文字、图片
+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName;

//button包含坐标、文字、图片、下标
+ (UIButton *)buttonWithFram:(CGRect)fram title:(NSString *)title imageName:(NSString *)imageName tag:(NSInteger)tag;

//导航栏按钮包含坐标、文字、图片
+ (UIButton *)navBtnWithFram:(CGRect)fram Title:(NSString *)title image:(NSString *)imageName;

//分割字符串获取答案
+ (NSArray *)getAnswerWithString:(NSString *)str;

//根据字体和内容设置大小
+ (CGSize)getSizeWithString:(NSString *)str font:(UIFont *)font size:(CGSize)size;

//设置label行距
+ (UILabel *)setLineSpaceWithLabel:(UILabel *)label;

//效验手机号
+ (BOOL)isValueToPhoneNumber:(NSString *)str;

//效验密码
+ (BOOL)isValueToCode:(NSString *)str;

//6位数字
+ (BOOL)isValueToDealCode:(NSString *)str;

//MD5字符串转换
+ (NSString*)md532BitLower:(NSString *)MD5;

//判断图片格式
+ (NSString *)typeForImageData:(NSData *)data;

//写入图片
+ (UIImage *)writhImageToFileWith:(UIImage *)image;

//裁剪图片
+ (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)size;

//数组排序
+ (NSArray *)sortArrayWith:(NSMutableArray *)array;

//清除缓存
+ (void)cancelWebCache;

//拨打电话
+ (void)makeCall:(UIView *)view phoneNum:(NSString *)str;

+ (void)setExtraCellLineHidden: (UITableView *)tableView;

//友盟分享
+ (void)UMSocialWithTitle:(NSString *)title url:(NSString *)url ws:(id)ws;

//友盟分享截图
+ (void)UMSocialImageWithImage:(UIImage *)image ws:(id)ws;

@end
