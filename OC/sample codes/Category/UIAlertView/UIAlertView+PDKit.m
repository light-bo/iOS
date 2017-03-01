//
//  UIAlertView+NTESBlock.m
//  eim_iphone
//
//  Created by amao on 12-11-7.
//  Copyright (c) 2012年 Netease. All rights reserved.
//


#import <objc/runtime.h>
#import "UIAlertView+PDKit.h"

static char kUIAlertViewBlockAddress;

@implementation UIAlertView (PDKit)

- (void)showAlertViewWithCompletionHandler:(PdAlertViewBlock)block {
    self.delegate = self;
    objc_setAssociatedObject(self, &kUIAlertViewBlockAddress, block,OBJC_ASSOCIATION_COPY);
    [self show];
}


- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    PdAlertViewBlock block = objc_getAssociatedObject(self, &kUIAlertViewBlockAddress);
    if (block) {
        block(buttonIndex);
        objc_setAssociatedObject(self, &kUIAlertViewBlockAddress, nil, OBJC_ASSOCIATION_COPY);
    }
}

- (void)clearActionBlock {
    self.delegate = nil;
    objc_setAssociatedObject(self, &kUIAlertViewBlockAddress, nil, OBJC_ASSOCIATION_COPY);
}

@end
