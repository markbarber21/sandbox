//
//  AppController.h
//  Web2PDF Server
//
//  Created by Jürgen on 13.09.06.
//  Copyright 2006 Cultured Code.
//  License: Creative Commons Attribution 2.5 License
//           http://creativecommons.org/licenses/by/2.5/
//

#import <Cocoa/Cocoa.h>

@class SimpleHTTPConnection, SimpleHTTPServer, WebView;

@interface AppController : NSObject {
    SimpleHTTPServer *server;

    IBOutlet WebView *webView;
}

- (void)setServer:(SimpleHTTPServer *)sv;
- (SimpleHTTPServer *)server;

- (void)processURL:(NSURL *)path connection:(SimpleHTTPConnection *)connection;
- (void)stopProcessing;

@end
