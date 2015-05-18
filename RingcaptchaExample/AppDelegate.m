//
//  AppDelegate.m
//  RingcaptchaExample
//
//  Created by Bruno Alassia on 5/18/15.
//  Copyright (c) 2015 Ringcaptcha. All rights reserved.
//

#import "AppDelegate.h"
#import <Ringcaptcha/Ringcaptcha.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSArray *elts = [[url query] componentsSeparatedByString:@"&"];
    for(int i = 0;i<[elts count];i++) {
        NSArray *pars = [[elts objectAtIndex:i] componentsSeparatedByString:@"="];
        [params setObject:[pars objectAtIndex:1] forKey:[pars objectAtIndex:0]];
    }
    
    if([params objectForKey:@"pin"] != nil) {
        
        UIWindow *window=[UIApplication sharedApplication].keyWindow;
        UIViewController* mainController = (UIViewController*) window.rootViewController;
        
        NSString* pin = [params objectForKey:@"pin"];
        NSLog(@"pin %@", pin);
        
        [Ringcaptcha verifyOnboardWithAppKeyAndPinCode:@"4ozucaco7e2o1iqy3ubi"
                                          andSecretKey:@"vivy4yzyre2e1edy6eru"
                                                andPin:pin
                                      inViewController:mainController
                                              delegate: nil
                                               success:^(RingcaptchaVerification *verification) {
                                                   NSLog(@"Verification process ended successfully? %@", verification.verificationId);
                                                   NSLog(@"Verification process ended successfully? %d", verification.verificationSuccessful);
                                                   NSLog(@"Verification process ended successfully? %@", verification.phoneNumber);
                                                   NSLog(@"Verification process ended successfully? %@", verification.errorDescription);
                                               }
                                                cancel:^(RingcaptchaVerification *verification) {
                                                    NSLog(@"Verification process cancelled? %d", verification.verificationSuccessful);
                                                }
         ];
        
    }
    return YES;
}

@end
