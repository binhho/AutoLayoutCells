//
//  ViewController.h
//  AutoLayoutCellsExample
//
//  Created by Joshua Greene on 9/5/14.
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

#import <UIKit/UIKit.h>
#import <AutoLayoutCells/ALTableViewCellFactoryDelegate.h>

/**
 *  `TableViewController` is a simple `UITableViewController` subclass for showing how `AutoLayoutCells` works using an adapter pattern.
 */
@interface TableViewController : UITableViewController
  <ALTableViewCellFactoryDelegate, UITableViewDataSource, UITableViewDelegate>

/**
 *  An array of `Model` objects
 */
@property (copy, nonatomic) NSArray *modelsArray;

/**
 *  This is a convenience method for setting the `models` array from the given plist name and bundle.
 *
 *  @param name      The name of the plist to use to creates the `models` array
 *  @param bundle    The bundle containing the plist
 */
- (void)setModelsFromPlistName:(NSString *)name bundle:(NSBundle *)bundle;

@end