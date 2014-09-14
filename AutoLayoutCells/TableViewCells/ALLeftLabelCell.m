//
//  ALLeftLabelCell.m
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

#import "ALLeftLabelCell.h"

#import "ALLeftLabelCellConstants.h"

@implementation ALLeftLabelCell

#pragma mark - Dynamic Type Text

- (void)refreshFonts
{
  [super refreshFonts];
  self.leftLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleCaption1];
}

#pragma mark - Set Values Dictionary

- (void)setSetValuesFromDictionary:(NSDictionary *)dictionary
{
  [super setSetValuesFromDictionary:dictionary];
  [self setLeftLabelTextFromDictionary:dictionary];
}

- (void)setLeftLabelTextFromDictionary:(NSDictionary *)dictionary
{
  if (dictionary[ALLeftLabelAttributedTextKey]) {
    [self setLeftLabelAttributedText:dictionary[ALLeftLabelAttributedTextKey]];
  } else {
    [self setLeftLabelText:dictionary[ALLeftLabelTextKey]];
  }
}

- (void)setLeftLabelAttributedText:(NSAttributedString *)text
{
  self.leftLabel.attributedText = text.length ? text : nil;
}

- (void)setLeftLabelText:(NSString *)text
{
  self.leftLabel.text = text.length ? text : nil;
}

@end
