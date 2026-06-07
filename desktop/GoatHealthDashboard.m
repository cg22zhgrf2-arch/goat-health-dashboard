#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>
@property(nonatomic, strong) NSWindow *window;
@property(nonatomic, strong) WKWebView *webView;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification {
  WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
  configuration.websiteDataStore = [WKWebsiteDataStore defaultDataStore];

  self.webView = [[WKWebView alloc] initWithFrame:NSZeroRect configuration:configuration];
  self.webView.allowsMagnification = YES;

  NSRect frame = NSMakeRect(0, 0, 1280, 860);
  self.window = [[NSWindow alloc]
    initWithContentRect:frame
              styleMask:(NSWindowStyleMaskTitled |
                         NSWindowStyleMaskClosable |
                         NSWindowStyleMaskMiniaturizable |
                         NSWindowStyleMaskResizable)
                backing:NSBackingStoreBuffered
                  defer:NO];

  self.window.title = @"Goat Health Dashboard";
  self.window.minSize = NSMakeSize(980, 680);
  self.window.contentView = self.webView;
  [self.window center];
  [self.window makeKeyAndOrderFront:nil];

  NSURL *indexURL = [[NSBundle mainBundle] URLForResource:@"index" withExtension:@"html"];
  NSURL *resourceURL = [[NSBundle mainBundle] resourceURL];

  if (indexURL && resourceURL) {
    [self.webView loadFileURL:indexURL allowingReadAccessToURL:resourceURL];
  } else {
    [self.webView loadHTMLString:@"<h1>Goat Health Dashboard</h1><p>index.html was not found in the app bundle.</p>"
                         baseURL:nil];
  }

  [NSApp activateIgnoringOtherApps:YES];
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
  return YES;
}

@end

int main(int argc, const char *argv[]) {
  @autoreleasepool {
    NSApplication *app = [NSApplication sharedApplication];
    AppDelegate *delegate = [[AppDelegate alloc] init];
    app.delegate = delegate;
    [app setActivationPolicy:NSApplicationActivationPolicyRegular];
    [app run];
  }
  return 0;
}
