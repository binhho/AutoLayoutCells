//
//  ALCell.h
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

#import "ALBaseCell.h"
#import <ALLabel/ALLabel.h>

/**
 *  `ALCell` shows a title and subtitle. It is also the base class for most of the cells within `AutoLayoutCells`.
 */
@interface ALCell : ALBaseCell

/**
 *  The title label
 */
@property (weak, nonatomic) IBOutlet ALLabel *titleLabel;

/**
 *  The subtitle label
 */
@property (weak, nonatomic) IBOutlet ALLabel *subtitleLabel;

@end

/**
 *  These methods should be considered "protected" and should only be called within this class or by subclasses.
 */
@interface ALCell (Protected)

/**
 *  This method is called within `setValuesDictionary:` to set the `titleLabel` text value.
 *  @see `ALCellConstants.h` title keys
 *
 *  @param dictionary The dictionary to be set
 */
- (void)setTitleFromDictionary:(NSDictionary *)dictionary;

/**
 *  This method is called within `setTitleFromDictionary:` to set the `titleLabel` attributed text (if present in the dictionary).
 *
 *  @param title The attributed title string to be set on `titleLabel`
 */
- (void)setAttributedTitleString:(NSAttributedString *)title;

/**
 *  This method is called within `setTitleFromDictionary:` to set the `titleLabel` text (if present in the dictionary without an attributed title).
 *
 *  @param title The title string to be set on `titleLabel`
 */
- (void)setTitleString:(NSString *)title;

/**
 *  This method is called within `setValuesDictionary:` to set the `subtitleLabel` text value.
 *  @see `ALCellConstants.h` subtitle keys
 *
 *  @param dictionary The dictionary to be set
 */
- (void)setSubtitleFromDictionary:(NSDictionary *)dictionary;

/**
 *  This method is called within `setSubtitleFromDictionary:` to set the `subtitleLabel` attributed text (if present in the dictionary).
 *
 *  @param subtitle The attributed subtitle string to be set on `subtitleLabel`
 */
- (void)setAttributedSubtitleString:(NSAttributedString *)subtitle;

/**
 *  This method is called within `setSubtitleFromDictionary:` to set the `subtitleLabel` text (if present in the dictionary withou an attributed subtitle).
 *
 *  @param subtitle The subtitle string to be set on `subtitleLabel`
 */
- (void)setSubtitleString:(NSString *)subtitle;

@end
