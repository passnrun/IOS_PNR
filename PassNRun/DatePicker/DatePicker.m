//
//  DatePicker.m
//  PassNRun
//
//  Created by Onur Idrisoglu on 8/17/12.
//
//

#import "DatePicker.h"

@interface DatePicker ()

@end

@implementation DatePicker

@synthesize data;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


//-- ComboBox

-(void) setData:(NSDate *)_data{
    data = _data;
    textField.text = [self dateTextInFormat:format];
}

-(void) setFormat:(NSString *)_format
{
    format = _format;
}

-(NSString*) selectedDateText
{
    return textField.text;
}
-(NSString*) dateTextInFormat:(NSString *)_format
{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:_format];
	NSString * dateText = [df stringFromDate:data];
	[df release];
    return dateText;
}

-(void)doneClicked:(id) sender
{
    [textField resignFirstResponder]; //hides the pickerView
}


- (IBAction)showPicker:(id)sender {
    
    datePicker = [[UIDatePicker alloc] init];
    datePicker.datePickerMode=UIDatePickerModeDate;
    datePicker.date = [NSDate date];
    [datePicker addTarget:self
                   action:@selector(changeDateInLabel:)
         forControlEvents:UIControlEventValueChanged];
    
    UIToolbar* toolbar = [[UIToolbar alloc] init];
    toolbar.barStyle = UIBarStyleBlackTranslucent;
    [toolbar sizeToFit];
    
    //to make the done button aligned to the right
    UIBarButtonItem *flexibleSpaceLeft = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    
    UIBarButtonItem* doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                   style:UIBarButtonItemStyleDone target:self
                                                                  action:@selector(doneClicked:)];
    
    
    [toolbar setItems:[NSArray arrayWithObjects:flexibleSpaceLeft, doneButton, nil]];
    
    //custom input view
    textField.inputView = datePicker;
    textField.inputAccessoryView = toolbar;
}

- (void)changeDateInLabel:(id)sender{
	[self setData:datePicker.date];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)aTextField
{
    [self showPicker:aTextField];
    return YES;
}

@end
