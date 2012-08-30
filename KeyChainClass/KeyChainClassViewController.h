//
//  KeyChainClassViewController.h
//  KeyChainClass
//
//  Created by Firodiya, Sanket on 8/28/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeychainItemWrapper;

@class SFHFKeychainUtils;

@interface KeyChainClassViewController : UIViewController{
    KeychainItemWrapper *keychainItemWrapper;
}
@property (weak, nonatomic) IBOutlet UITextField *usernameInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (weak, nonatomic) IBOutlet UILabel *passwordOutput;
@end
