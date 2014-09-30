//
//  UIActionPicker.h
//  dressbook
//
//  Created by Hydra on 2014/9/30.
//  Copyright (c) 2014年 TSD-Ethan. All rights reserved.
//

#ifndef dressbook_UIActionPicker_h
#define dressbook_UIActionPicker_h

@protocol UIActionPickerDelegate;


@interface UIActionPicker : UIView <UIPickerViewDelegate, UIPickerViewDataSource>
{
    
}

@property(strong, nonatomic) UIPickerView *myPickerView;
@property(strong, nonatomic) UIButton *myDoneButton;
@property(weak,nonatomic) id<UIActionPickerDelegate> delegate;


@end

@protocol UIActionPickerDelegate <NSObject>
@required
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component;
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component ;

@end

#endif
