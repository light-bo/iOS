//
//  NSDictionary+JsonFile.h
//  bookshelf
//
//  Created by 李旭波 on 15/11/13.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JsonFile)

+ (NSDictionary *)dictionaryWithJsonFile:(NSString *)fileName;

@end
