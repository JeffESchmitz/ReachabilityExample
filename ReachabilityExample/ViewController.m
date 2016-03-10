//
//  ViewController.m
//  ReachabilityExample
//
//  Created by Jeff Schmitz on 3/4/16.
//  Copyright © 2016 Jeff Schmitz. All rights reserved.
//

#import "ViewController.h"
#import "Reachability.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    if (self) {
        // Add Observer
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityDidChange:) name:kReachabilityChangedNotification object:nil];
    }
}

- (void)reachabilityDidChange:(NSNotification *)notification {
    Reachability *reachability = (Reachability *)[notification object];    
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    switch (networkStatus) {
        case NotReachable:
            NSLog(@"Reachability: No WiFi network connection");
            break;
        
        case ReachableViaWiFi:
            NSLog(@"Reachability: Has WiFi network connection");
        case ReachableViaWWAN:
            NSLog(@"Reachability: Has WWAN network connection");
            break;

        default:
            NSLog(@"Warning! reachability default case executed");
            break;
    }
}


@end
