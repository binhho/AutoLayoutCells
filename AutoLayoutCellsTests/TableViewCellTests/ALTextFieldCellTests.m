//
//  ALTextFieldCell.m
//  AutoLayoutCells
//
//  Created by Joshua Greene on 9/10/14.
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

// Test Class
#import "ALTextFieldCell.h"

// Collaborators
#import "ALTextCellConstants.h"
#import "ALCellDelegate.h"

// Test Support
#import <XCTest/XCTest.h>

#define EXP_SHORTHAND YES
#import <Expecta/Expecta.h>

#import <OCMock/OCMock.h>

#import "Test_ALTableViewCellNibFactory.h"

@interface ALTextFieldCellTests : XCTestCase
@end

@implementation ALTextFieldCellTests
{
  ALTextFieldCell *sut;

  id mockTextField;
  id mockDelegate;
}

#pragma mark - Test Lifecycle

- (void)setUp
{
  [super setUp];
  sut = [Test_ALTableViewCellNibFactory cellWithName:@"ALTextFieldCell" owner:self];
}

#pragma mark - Given

- (void)givenMockTextField
{
  mockTextField = OCMClassMock([UITextField class]);
  sut.textField = mockTextField;
}

- (void)givenMockDelegate
{
  mockDelegate = OCMProtocolMock(@protocol(ALCellDelegate));
  sut.delegate = mockDelegate;
}

#pragma mark - Outlet - Tests

- (void)test_has___titleLabel
{
  expect(sut.titleLabel).toNot.beNil();
}

- (void)test_has___textField
{
  expect(sut.textField).toNot.beNil();
}

#pragma mark - Dynamic Type Text

- (void)test___refreshFonts___refresh_textField
{
  // given
  [self givenMockDelegate];
  
  UIFont *font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  
  OCMExpect([mockTextField setFont:font]);
  
  // when
  [sut refreshFonts];
  
  // then
  OCMVerifyAll(mockTextField);
}

#pragma mark - Set Values Dictionary - Tests

//- (void)test___setValuesDictionary___setsTextField_ALCellAttributedValueKey
//{
//  // given
//  [self givenMockTextField];
//  
//  NSAttributedString *text = [[NSAttributedString alloc] initWithString:@"String" attributes:nil];
//  NSDictionary *dict = @{ALCellAttributedValueKey: text};
//  
//  OCMExpect([mockTextField setAttributedText:text]);
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  OCMVerifyAll(mockTextField);
//}
//
//- (void)test___setValuesDictionary___setsTextField_ALCellValueKey
//{
//  // given
//  [self givenMockTextField];
//  
//  NSString *text = @"String";
//  NSDictionary *dict = @{ALCellValueKey: text};
//  OCMExpect([mockTextField setText:text]);
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  OCMVerifyAll(mockTextField);
//}
//
//- (void)test___setValuesDictionary___setsTextField_ALTextCellPlaceholderTextKey
//{
//  // given
//  [self givenMockTextField];
//  NSString *placeholder = @"Placeholder";
//  NSDictionary *dict = @{ALTextCellPlaceholderTextKey: placeholder};
//  
//  OCMExpect([mockTextField setPlaceholder:placeholder]);
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  OCMVerifyAll(mockTextField);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellTypeDefault
//{
//  // given
//  NSDictionary *dict = @{ALTextCellTypeKey: @(ALTextCellTypeDefault)};
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  expect(sut.textField.autocapitalizationType).to.equal(UITextAutocapitalizationTypeSentences);
//  expect(sut.textField.autocorrectionType).to.equal(UITextAutocorrectionTypeDefault);
//  expect(sut.textField.keyboardType).to.equal(UIKeyboardTypeDefault);
//  expect(sut.textField.secureTextEntry).to.beFalsy();
//  expect(sut.textField.spellCheckingType).to.equal(UITextSpellCheckingTypeDefault);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellTypeEmail
//{
//  // given
//  NSDictionary *dict = @{ALTextCellTypeKey: @(ALTextCellTypeEmail)};
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  expect(sut.textField.autocapitalizationType).to.equal(UITextAutocapitalizationTypeNone);
//  expect(sut.textField.autocorrectionType).to.equal(UITextAutocorrectionTypeNo);
//  expect(sut.textField.keyboardType).to.equal(UIKeyboardTypeEmailAddress);
//  expect(sut.textField.secureTextEntry).to.beFalsy();
//  expect(sut.textField.spellCheckingType).to.equal(UITextSpellCheckingTypeNo);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellTypeName
//{
//  // given
//  NSDictionary *dict = @{ALTextCellTypeKey: @(ALTextCellTypeName)};
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  expect(sut.textField.autocapitalizationType).to.equal(UITextAutocapitalizationTypeWords);
//  expect(sut.textField.autocorrectionType).to.equal(UITextAutocorrectionTypeNo);
//  expect(sut.textField.keyboardType).to.equal(UIKeyboardTypeDefault);
//  expect(sut.textField.secureTextEntry).to.beFalsy();
//  expect(sut.textField.spellCheckingType).to.equal(UITextSpellCheckingTypeNo);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellTypeNoChecking
//{
//  // given
//  NSDictionary *dict = @{ALTextCellTypeKey: @(ALTextCellTypeNoChecking)};
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  expect(sut.textField.autocapitalizationType).to.equal(UITextAutocapitalizationTypeNone);
//  expect(sut.textField.autocorrectionType).to.equal(UITextAutocorrectionTypeNo);
//  expect(sut.textField.keyboardType).to.equal(UIKeyboardTypeDefault);
//  expect(sut.textField.secureTextEntry).to.beFalsy();
//  expect(sut.textField.spellCheckingType).to.equal(UITextSpellCheckingTypeNo);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellTypePassword
//{
//  // given
//  NSDictionary *dict = @{ALTextCellTypeKey: @(ALTextCellTypePassword)};
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  expect(sut.textField.autocapitalizationType).to.equal(UITextAutocapitalizationTypeNone);
//  expect(sut.textField.autocorrectionType).to.equal(UITextAutocorrectionTypeNo);
//  expect(sut.textField.keyboardType).to.equal(UIKeyboardTypeDefault);
//  expect(sut.textField.secureTextEntry).to.beTruthy();
//  expect(sut.textField.spellCheckingType).to.equal(UITextSpellCheckingTypeNo);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellTypeSentences
//{
//  // given
//  NSDictionary *dict = @{ALTextCellTypeKey: @(ALTextCellTypeSentences)};
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  expect(sut.textField.autocapitalizationType).to.equal(UITextAutocapitalizationTypeSentences);
//  expect(sut.textField.autocorrectionType).to.equal(UITextAutocorrectionTypeYes);
//  expect(sut.textField.keyboardType).to.equal(UIKeyboardTypeDefault);
//  expect(sut.textField.secureTextEntry).to.beFalsy();
//  expect(sut.textField.spellCheckingType).to.equal(UITextSpellCheckingTypeYes);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellTypeNumber
//{
//  // given
//  NSDictionary *dict = @{ALTextCellTypeKey: @(ALTextCellTypeNumber)};
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  expect(sut.textField.autocapitalizationType).to.equal(UITextAutocapitalizationTypeNone);
//  expect(sut.textField.autocorrectionType).to.equal(UITextAutocorrectionTypeNo);
//  expect(sut.textField.keyboardType).to.equal(UIKeyboardTypeNumberPad);
//  expect(sut.textField.secureTextEntry).to.beFalsy();
//  expect(sut.textField.spellCheckingType).to.equal(UITextSpellCheckingTypeNo);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellType_missing_doesNotConfigureTextField
//{
//  // given
//  [self givenMockTextField];
//  NSDictionary *dict = nil;
//  
//  [[[mockTextField reject] ignoringNonObjectArgs] setAutocapitalizationType:0];
//  [[[mockTextField reject] ignoringNonObjectArgs] setAutocorrectionType:0];
//  [[[mockTextField reject] ignoringNonObjectArgs] setKeyboardType:0];
//  [[[mockTextField reject] ignoringNonObjectArgs] setSecureTextEntry:NO];
//  [[[mockTextField reject] ignoringNonObjectArgs] setSpellCheckingType:0];
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  OCMVerifyAll(mockTextField);
//}
//
//- (void)test___setValuesDictionary___textCellType___ALTextCellType_invalidType_doesNotConfigureTextField
//{
//  // given
//  [self givenMockTextField];
//  NSDictionary *dict = @{ALTextCellTypeKey: @(NSIntegerMax)};
//  
//  [[[mockTextField reject] ignoringNonObjectArgs] setAutocapitalizationType:0];
//  [[[mockTextField reject] ignoringNonObjectArgs] setAutocorrectionType:0];
//  [[[mockTextField reject] ignoringNonObjectArgs] setKeyboardType:0];
//  [[[mockTextField reject] ignoringNonObjectArgs] setSecureTextEntry:NO];
//  [[[mockTextField reject] ignoringNonObjectArgs] setSpellCheckingType:0];
//  
//  // when
//  [sut setValuesDictionary:dict];
//  
//  // then
//  OCMVerifyAll(mockTextField);
//}
//
//#pragma mark - Text Field Actions - Tests
//
//- (void)test___textFieldShouldBeginEditing___notifiesDelegate___cellWillBeginEditing
//{
//  // given
//  [self givenMockDelegate];
//  OCMExpect([mockDelegate cellWillBeginEditing:sut]);
//  
//  // when
//  [sut textFieldShouldBeginEditing:sut.textField];
//  
//  // then
//  OCMVerifyAll(mockDelegate);
//}
//
//- (void)test___textFieldShouldBeginEditing___returns_YES
//{
//  expect([sut textFieldShouldBeginEditing:sut.textField]).to.beTruthy();
//}
//
//- (void)test___textFieldValueChanged___notifiesDelegate___cell_valueChanged
//{
//  // given
//  [self givenMockDelegate];
//  
//  sut.textField.text = @"Text";
//  OCMExpect([mockDelegate cell:sut valueChanged:sut.textField.text]);
//  
//  // when
//  [sut textFieldValueChanged:sut.textField];
//  
//  // then
//  OCMVerifyAll(mockDelegate);
//}
//
//- (void)test___textFieldDidEndEditing___notifiesDelegate___cell_didEndEditing
//{
//  // given
//  [self givenMockDelegate];
//  
//  sut.textField.text = @"Text";
//  OCMExpect([mockDelegate cell:sut didEndEditing:sut.textField.text]);
//  
//  // when
//  [sut textFieldDidEndEditing:sut.textField];
//  
//  // then
//  OCMVerifyAll(mockDelegate);
//}

@end