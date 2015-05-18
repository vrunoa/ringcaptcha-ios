//
//  ViewController.m
//  RingcaptchaExample
//
//  Created by Bruno Alassia on 5/18/15.
//  Copyright (c) 2015 Ringcaptcha. All rights reserved.
//

#import "ViewController.h"
#import <Ringcaptcha/Ringcaptcha.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) getLog:(id) sender {
    
    NSString* log = [Ringcaptcha dumpLog];
    NSLog(@"%@", log);
}

- (IBAction)clearLog:(id)sender {
    

}

- (IBAction)login:(id)sender {
    
    [Ringcaptcha verifyOnboardWithAppKey:@"4ozucaco7e2o1iqy3ubi"
                            andSecretKey:@"vivy4yzyre2e1edy6eru"
                        inViewController:self
                                delegate: nil
                                 success:^(RingcaptchaVerification *verification) {
                                     NSLog(@"Verification process ended successfully? %@", verification.verificationId);
                                     NSLog(@"Verification process ended successfully? %d", verification.verificationSuccessful);
                                     NSLog(@"Verification process ended successfully? %@", verification.phoneNumber);
                                     NSLog(@"Verification process ended successfully? %@", verification.errorDescription);
                                 } cancel:^(RingcaptchaVerification *verification) {
                                     NSLog(@"Verification process cancelled? %d", verification.verificationSuccessful);
                                 }];
    
}

@end
