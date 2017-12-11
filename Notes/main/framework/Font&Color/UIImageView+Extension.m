//
//  UIImageView+Extension.m
//  InnoSpace
//
//  Created by admin on 2017/12/7.
//  Copyright © 2017年 zfd. All rights reserved.
//

#import "UIImageView+Extension.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (Extension)

-(void)imageFromURL:(NSString *)urlStr holder:(UIImage *)image {
    NSURL *url = [NSURL URLWithString:urlStr];
    [self sd_setImageWithURL:url placeholderImage:image];
}

@end
