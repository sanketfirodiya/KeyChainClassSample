//
//  KeyChainClassViewController.m
//  KeyChainClass
//
//  Created by Firodiya, Sanket on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import <Security/Security.h>

#import "KeyChainClassViewController.h"
#import "SFHFKeychainUtils.h"

@interface KeyChainClassViewController ()

@end

@implementation KeyChainClassViewController
@synthesize usernameInput = _usernameInput;
@synthesize passwordInput = _passwordInput;
@synthesize passwordOutput = _passwordOutput;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setUsernameInput:nil];
    [self setPasswordInput:nil];
    [self setPasswordOutput:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}
- (IBAction)createUser:(id)sender 
{
    NSString *value = self.usernameInput.text;
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:value forKey:@"USERNAME"];
    [defaults synchronize];
    [SFHFKeychainUtils storeUsername:self.usernameInput.text andPassword:self.passwordInput.text forServiceName:@"myApp" updateExisting:TRUE error:nil];
    self.usernameInput.text = @"";
    self.passwordInput.text = @"";
}

- (IBAction)showPassword:(id)sender 
{
    NSString *pass = [[NSString alloc] init];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *username = [defaults objectForKey:@"USERNAME"];
    pass = [SFHFKeychainUtils getPasswordForUsername:username andServiceName:@"myApp" error:nil];
    self.passwordOutput.text = pass;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
