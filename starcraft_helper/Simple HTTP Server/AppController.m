//
//  AppController.m
//  Web2PDF Server
//
//  Created by Jürgen on 13.09.06.
//  Copyright 2006 Cultured Code.
//  License: Creative Commons Attribution 2.5 License
//           http://creativecommons.org/licenses/by/2.5/
//

#import "AppController.h"
#import "SimpleHTTPConnection.h"
#import "SimpleHTTPServer.h"
#import <WebKit/WebKit.h>
#import <stdio.h>
#import <string.h>
#import <sys/socket.h>
#include <arpa/inet.h>

@interface AppController (PrivateMethods)
- (NSString *)applicationSupportFolder;
//- (NSURL *)currentURL;
@end

@implementation AppController

- (void)awakeFromNib
{
    [self setServer:[[[SimpleHTTPServer alloc] initWithTCPPort:50000
                                                      delegate:self] autorelease]];
}

- (void)dealloc
{
    [server release];
    [super dealloc];
}

- (void)setServer:(SimpleHTTPServer *)sv
{
    [server autorelease];
    server = [sv retain];
}
- (SimpleHTTPServer *)server { return server; }

- (void)processURL:(NSURL *)path connection:(SimpleHTTPConnection *)connection
{
    NSString *urlString = [@"http:/" stringByAppendingString:[path absoluteString]];
    NSURL *url = [NSURL URLWithString:urlString];
    if( url ) {
        [[webView mainFrame] loadRequest:[NSURLRequest requestWithURL:url]];
    } else {
        NSString *errorMsg = [NSString stringWithFormat:@"Error in URL: %@", urlString];
        NSLog(@"%@", errorMsg);
        [server replyWithStatusCode:400 // Bad Request
                            message:errorMsg];
    }
}

- (void)stopProcessing
{
    [[webView mainFrame] stopLoading];
}

/*- (NSURL *)currentURL
{
    return [[[[webView mainFrame] dataSource] initialRequest] URL];
}*/

- (void)webView:(WebView *)sender didFinishLoadForFrame:(WebFrame *)frame
{
    if( [frame parentFrame] == nil ) {        
        NSView *docView = [[frame frameView] documentView];

        // Work-around: we need to print to a file first
        // Otherwise WebKit will not acknowledge NSAutoPagination,
        // but default to scaling instead
        NSString *path = [[self applicationSupportFolder] stringByAppendingPathComponent:@"LastJob.pdf"];
        NSPrintInfo *pInfo = [[NSPrintInfo alloc] initWithDictionary:
            [NSDictionary dictionaryWithObjectsAndKeys:
                path, NSPrintSavePath, nil]];
        [pInfo setVerticalPagination:NSAutoPagination];
        [pInfo setJobDisposition:NSPrintSaveJob];
        NSPrintOperation *op;
        op = [NSPrintOperation printOperationWithView:docView printInfo:pInfo];
        [op setShowsPrintPanel:NO];
        BOOL success = [op runOperation];
        [pInfo release];

        if( success == NO ) {
            NSString *errorMsg = @"Could not generate PDF";
            NSLog(@"%@", errorMsg);
            [server replyWithStatusCode:500 // Internal Server Error
                                message:errorMsg];
        } else {
            NSError *error = nil;
            NSData *PDFData = [NSData dataWithContentsOfFile:path
                                                     options:NSUncachedRead
                                                       error:&error];
            if( error == nil ) {
                [server replyWithData:PDFData MIMEType:@"application/pdf"];
            } else {
                NSString *errorMsg = [NSString stringWithFormat:@"Error while reading the PDF file (%@)", [[server currentRequest] objectForKey:@"url"]];
                NSLog(@"%@", errorMsg);
                [server replyWithStatusCode:500 message:errorMsg];
            }
        }
    }
}

- (void)webView:(WebView *)sender didFailProvisionalLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{
    if( [frame parentFrame] == nil && [error code] != NSURLErrorCancelled ) {
        NSString *errorMsg = [NSString stringWithFormat:@"Error loading %@: %@",
            [[error userInfo] objectForKey:NSErrorFailingURLStringKey],
                [error localizedDescription]];
        NSLog(@"%@", errorMsg);
        [server replyWithStatusCode:400 // Bad Request
                            message:errorMsg];
    }
}

- (void)webView:(WebView *)sender didFailLoadWithError:(NSError *)error forFrame:(WebFrame *)frame
{
    if( [frame parentFrame] == nil && [error code] != NSURLErrorCancelled ) {
        NSString *errorMsg = [NSString stringWithFormat:@"Error loading %@: %@",
            [[error userInfo] objectForKey:NSErrorFailingURLStringKey],
            [error localizedDescription]];
        NSLog(@"%@", errorMsg);
        [server replyWithStatusCode:400 // Bad Request
                            message:errorMsg];
    }
}

- (NSString *)applicationSupportFolder
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, NSUserDomainMask, YES);
    
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : NSTemporaryDirectory();
    
    NSFileManager *manager = [NSFileManager defaultManager];
    
	basePath = [basePath stringByAppendingPathComponent:@"Cultured Code"];
	if( ![manager fileExistsAtPath:basePath] ) {
		[manager createDirectoryAtPath:basePath attributes:nil];
    }
    
	NSString *appSupportFolder = [basePath stringByAppendingPathComponent:@"SimpleHTTPServer"];
	if( ![manager fileExistsAtPath:appSupportFolder] )
		[manager createDirectoryAtPath:appSupportFolder attributes:nil];	
	
    return appSupportFolder;
}

@end
