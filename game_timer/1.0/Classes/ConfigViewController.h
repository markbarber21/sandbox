//
//  ConfigViewController.h
//  GameTimer
//
//  Created by Mark Barber on 6/10/10.
//  Copyright 2010 Mark Barber . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RootViewController.h"


@interface ConfigViewController : UIViewController <SubstitutableDetailViewController> {
    UIToolbar *toolbar;
    
    id detailItem;

}

// IB properties
@property (nonatomic, retain) IBOutlet UIToolbar *toolbar;
@property (nonatomic, retain) id detailItem;

@end
