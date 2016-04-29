#import "getlunchRun.h"
#import <Cordova/CDV.h>

@implementation getlunchRun

- (void)yandexnavi:(CDVInvokedUrlCommand*)command {
    
    CDVPluginResult *pluginResult = nil;
    NSString *scheme = [command.arguments objectAtIndex:0];
	NSString *result = [NSString stringWithFormat:@"%@%@", @"yandexnavi://build_route_on_map?", scheme];
	NSURL *naviURL = [NSURL URLWithString:result];
	
	if ([[UIApplication sharedApplication] canOpenURL:naviURL]) {
		// Если Навигатор установлен - открываем его
		[[UIApplication sharedApplication] openURL:naviURL];
		//pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
	} else {
		// Если не установлен - открываем страницу в App Store
		NSURL *appStoreURL = [NSURL URLWithString:@"https://itunes.apple.com/ru/app/yandeks.navigator/id474500851?mt=8"];
		[[UIApplication sharedApplication] openURL:appStoreURL];
		//pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsBool:(false)];
	}
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)telcall:(CDVInvokedUrlCommand*)command {

    CDVPluginResult *pluginResult = nil;
    NSString *scheme = [command.arguments objectAtIndex:0];
	NSString *result = [NSString stringWithFormat:@"%@%@", @"tel:", scheme];

	result = [result stringByReplacingOccurrencesOfString:@"+" withString:@""];
	result = [result stringByReplacingOccurrencesOfString:@" " withString:@""];
	result = [result stringByReplacingOccurrencesOfString:@"(" withString:@""];
	result = [result stringByReplacingOccurrencesOfString:@")" withString:@""];
	
	NSURL *naviURL = [NSURL URLWithString:result];
	
	[[UIApplication sharedApplication] openURL:naviURL];
	//pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:(true)];
	pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:result];
	[self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

@end