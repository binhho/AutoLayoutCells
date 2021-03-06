//
//  UIImageView+ALActivityIndicatorView.m
//  AutoLayoutCells
//
//  Created by Joshua Greene on 9/6/14.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "UIImageView+ALActivityIndicatorView.h"
#import <objc/runtime.h>

@implementation UIImageView (ALActivityIndicatorView)

#pragma mark - Activity Indicator View

- (UIActivityIndicatorView *)AL_activityIndicatorView;
{
  return objc_getAssociatedObject(self, &ALActivityIndicatorKey);
}

- (UIActivityIndicatorView *)AL_addActivityIndicatorViewWithStyle:(UIActivityIndicatorViewStyle)style
{
  UIActivityIndicatorView *indicator = self.AL_activityIndicatorView;
  
  if (![self AL_isValidActivityIndicatorViewStyle:style]) {
    
    if (indicator) {
      [self AL_removeActivityIndicatorView];
    }
    return nil;
    
  } else if (!indicator || indicator.activityIndicatorViewStyle != style) {
    indicator = [self AL_setupActivityIndicatorViewWithStyle:style];
    
    [self AL_performBlockOnMainThread:^{
      [self addSubview:indicator];
      objc_setAssociatedObject(self, &ALActivityIndicatorKey, indicator, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }];
  }
  
  return indicator;
}

- (BOOL)AL_isValidActivityIndicatorViewStyle:(UIActivityIndicatorViewStyle)style
{
  return style == UIActivityIndicatorViewStyleGray  ||
         style == UIActivityIndicatorViewStyleWhite ||
         style == UIActivityIndicatorViewStyleWhiteLarge;
}

- (void)AL_removeActivityIndicatorView
{
  [self AL_performBlockOnMainThread:^{
    [self.AL_activityIndicatorView removeFromSuperview];
    objc_setAssociatedObject(self, &ALActivityIndicatorKey, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
  }];
}

- (UIActivityIndicatorView *)AL_setupActivityIndicatorViewWithStyle:(UIActivityIndicatorViewStyle)style
{
  UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:style];

  indicator.autoresizingMask = UIViewAutoresizingFlexibleTopMargin    |
                               UIViewAutoresizingFlexibleBottomMargin |
                               UIViewAutoresizingFlexibleLeftMargin   |
                               UIViewAutoresizingFlexibleRightMargin;
  
  indicator.center = CGPointMake(CGRectGetWidth(self.frame)/2.0f, CGRectGetHeight(self.frame)/2.0f);
  indicator.hidesWhenStopped = YES;
  indicator.userInteractionEnabled = NO;
  
  return indicator;
}

#pragma mark - Multithreading

- (void)AL_performBlockOnMainThread:(void(^)())block
{
  if ([NSThread isMainThread]) {
    block();
    
  } else {
    dispatch_async(dispatch_get_main_queue(), block);
  }
}

@end
