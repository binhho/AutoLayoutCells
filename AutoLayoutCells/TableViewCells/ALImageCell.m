//
//  ALImageCell.m
//  AutoLayoutCells
//
//  Created by Joshua Greene on 07/11/14.
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

#import "ALImageCell.h"
#import <AFNetworking+ImageActivityIndicator/AFNetworking+ImageActivityIndicator.h>

#import "ALImageCellConstants.h"

@interface ALImageCell()
@property (assign, nonatomic) CGFloat mainImageViewLeadingConstraintConstant;
@property (assign, nonatomic) CGFloat mainImageViewTrailingConstraintConstant;
@property (assign, nonatomic) CGFloat mainImageViewWidthConstraintConstant;

@property (assign, nonatomic) CGFloat secondaryImageViewLeadingConstraintConstant;
@property (assign, nonatomic) CGFloat secondaryImageViewTrailingConstraintConstant;
@property (assign, nonatomic) CGFloat secondaryImageViewWidthConstraintConstant;
@end

@implementation ALImageCell

#pragma mark - Custom Accessors

- (void)setMainImageViewLeadingConstraint:(NSLayoutConstraint *)constraint
{
  if (_mainImageViewLeadingConstraint == constraint) {
    return;
  }
  
  _mainImageViewLeadingConstraint = constraint;
  self.mainImageViewLeadingConstraintConstant = constraint.constant;
}

- (void)setMainImageViewTrailingConstraint:(NSLayoutConstraint *)constraint
{
  if (_mainImageViewTrailingConstraint == constraint) {
    return;
  }
  
  _mainImageViewTrailingConstraint = constraint;
  self.mainImageViewTrailingConstraintConstant = constraint.constant;
}

- (void)setMainImageViewWidthConstraint:(NSLayoutConstraint *)constraint
{
  if (_mainImageViewWidthConstraint == constraint) {
    return;
  }
  
  _mainImageViewWidthConstraint = constraint;
  self.mainImageViewWidthConstraintConstant = constraint.constant;
}

- (void)setSecondaryImageViewLeadingConstraint:(NSLayoutConstraint *)constraint
{
  if (_secondaryImageViewLeadingConstraint == constraint) {
    return;
  }
  
  _secondaryImageViewLeadingConstraint = constraint;
  self.secondaryImageViewLeadingConstraintConstant = constraint.constant;
}

- (void)setSecondaryImageViewTrailingConstraint:(NSLayoutConstraint *)constraint
{
  if (_secondaryImageViewTrailingConstraint == constraint) {
    return;
  }
  
  _secondaryImageViewTrailingConstraint = constraint;
  self.secondaryImageViewTrailingConstraintConstant = constraint.constant;
}

- (void)setSecondaryImageViewWidthConstraint:(NSLayoutConstraint *)constraint
{
  if (_secondaryImageViewWidthConstraint == constraint) {
    return;
  }
  
  _secondaryImageViewWidthConstraint = constraint;
  self.secondaryImageViewWidthConstraintConstant = constraint.constant;
}

#pragma mark - Public

- (void)setValuesDictionary:(NSDictionary *)dictionary
{
  [super setValuesDictionary:dictionary];

  [self setMainPlaceholderImageFromDictionary:dictionary];
  [self setSecondaryPlaceholderImageFromDictionary:dictionary];
  
  [self setMainImageViewFromDictionary:dictionary];
  [self setSecondaryImageViewFromDictionary:dictionary];
}

#pragma mark - Protected

- (void)setMainPlaceholderImageFromDictionary:(NSDictionary *)dictionary
{
  if (dictionary[ALImageCellMainPlaceholderImageKey]) {
    self.mainPlaceholderImage = dictionary[ALImageCellMainPlaceholderImageKey];
  }
}

- (void)setSecondaryPlaceholderImageFromDictionary:(NSDictionary *)dictionary
{
  if (dictionary[ALImageCellSecondaryPlaceholderImageKey]) {
    self.secondaryPlaceholderImage = dictionary[ALImageCellSecondaryPlaceholderImageKey];
  }
}

#pragma mark - setMainImageViewFromDictionary:

- (void)setMainImageViewFromDictionary:(NSDictionary *)dictionary
{
  [self resetMainImageViewConstraintConstants];
  
  if (dictionary[ALImageCellMainImageKey]) {
    [self.mainImageView setImage:dictionary[ALImageCellMainImageKey]];
    
  } else if ([dictionary[ALImageCellMainImageNameKey] length]) {
    [self.mainImageView setImage:[UIImage imageNamed:dictionary[ALImageCellMainImageNameKey]]];
    
  } else if ([dictionary[ALImageCellMainImageURLStringKey] length]) {
    [self setImageFromURL:[NSURL URLWithString:dictionary[ALImageCellMainImageURLStringKey]]
              onImageView:self.mainImageView
         placeholderImage:self.mainPlaceholderImage];
    
  } else if (dictionary[ALImageCellMainImageURLKey]) {
    [self setImageFromURL:dictionary[ALImageCellMainImageURLKey]
              onImageView:self.mainImageView
         placeholderImage:self.mainPlaceholderImage];
    
  } else {
    [self setMainImageViewConstraintsToZero];
  }
}

- (void)resetMainImageViewConstraintConstants
{
  self.mainImageViewLeadingConstraint.constant = self.mainImageViewLeadingConstraintConstant;
  self.mainImageViewTrailingConstraint.constant = self.mainImageViewTrailingConstraintConstant;
  self.mainImageViewWidthConstraint.constant = self.mainImageViewWidthConstraintConstant;
}

- (void)setMainImageViewConstraintsToZero
{
  self.mainImageViewLeadingConstraint.constant = 0;
  self.mainImageViewTrailingConstraint.constant = 0;
  self.mainImageViewWidthConstraint.constant = 0;
}

#pragma mark - setSecondaryImageViewFromDictionary:

- (void)setSecondaryImageViewFromDictionary:(NSDictionary *)dictionary
{
  [self resetSecondaryImageViewConstraintConstants];
  
  if (dictionary[ALImageCellSecondaryImageKey]) {
    [self.secondaryImageView setImage:dictionary[ALImageCellSecondaryImageKey]];
    
  } else if ([dictionary[ALImageCellSecondaryImageNameKey] length]) {
    [self.secondaryImageView setImage:[UIImage imageNamed:dictionary[ALImageCellSecondaryImageNameKey]]];
    
  } else if ([dictionary[ALImageCellSecondaryImageURLStringKey] length]) {
    [self setImageFromURL:[NSURL URLWithString:dictionary[ALImageCellSecondaryImageURLStringKey]]
              onImageView:self.secondaryImageView
         placeholderImage:self.secondaryPlaceholderImage];
    
  } else if (dictionary[ALImageCellSecondaryImageURLKey]) {
    [self setImageFromURL:dictionary[ALImageCellSecondaryImageURLKey]
              onImageView:self.secondaryImageView
         placeholderImage:self.secondaryPlaceholderImage];
    
  } else {
    [self setSecondaryImageViewConstraintsToZero];
  }
}

- (void)resetSecondaryImageViewConstraintConstants
{
  self.secondaryImageViewLeadingConstraint.constant = self.secondaryImageViewLeadingConstraintConstant;
  self.secondaryImageViewTrailingConstraint.constant = self.secondaryImageViewTrailingConstraintConstant;
  self.secondaryImageViewWidthConstraint.constant = self.secondaryImageViewWidthConstraintConstant;
}

- (void)setSecondaryImageViewConstraintsToZero
{
  self.secondaryImageViewLeadingConstraint.constant = 0;
  self.secondaryImageViewTrailingConstraint.constant = 0;
  self.secondaryImageViewWidthConstraint.constant = 0;
}

#pragma mark - setImageFromURL: onImageView: placeholderImage:

- (void)setImageFromURL:(NSURL *)url
            onImageView:(UIImageView *)imageView
       placeholderImage:(UIImage *)placeholderImage
{
  if (self.disableLoadingFromImageURL) {
    return;
  }
  
  [imageView setImage:nil];
  
  if (!url) {
    return;
  }
  
  [imageView setImageWithURLRequest:[NSURLRequest requestWithURL:url]
                   placeholderImage:placeholderImage
        usingActivityIndicatorStyle:[self activityIndicatorStyle]
                            success:nil
                            failure:nil];
}

- (UIActivityIndicatorViewStyle)activityIndicatorStyle
{
  return UIActivityIndicatorViewStyleGray;
}

@end
