- (void)setTabBarShowOrHind:(BOOL)bIsShown withAnimationg:(BOOL)bWithAnimationg {
    if ([self tabBarIsShown] == bIsShown) return;
    
    CGFloat cgfHeight = self.tabBarController.tabBar.frame.size.height;
    CGFloat cgfOffsetY = (bIsShown)? -cgfHeight : cgfHeight;
    CGFloat cgfDuration = (bWithAnimationg)? 0.3 : 0.0;
    
    [UIView animateWithDuration:cgfDuration animations:^{
        self.tabBarController.tabBar.frame = CGRectOffset(self.tabBarController.tabBar.frame, 0, cgfOffsetY);
    }];
}

- (BOOL)tabBarIsShown {
    return self.tabBarController.tabBar.frame.origin.y < CGRectGetMaxY(self.view.frame);
}

- (void)uibSubmmitClicked {
    [self setTabBarVisible:![self tabBarIsShown] withAnimationg:YES];
}