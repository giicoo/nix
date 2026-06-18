{ self, inputs, ... }: {
  flake.homeModules.telegram = { pkgs, lib, ... }: {
    home.packages = [ pkgs.telegram-desktop ];

    xdg.configFile."TelegramDesktop/themes/vague.tdesktop-theme" = {
      source = pkgs.runCommand "vague-tdesktop-theme" {} ''
        mkdir -p $out
        cat > $out/colors.tdesktop-theme <<EOF
        // Vague theme for Telegram
        windowBg: #141415;
        windowFg: #cdcdcd;
        windowBgOver: #1c1c24;
        windowBgRipple: #252530;
        windowFgOver: #cdcdcd;
        windowSubTextFg: #606079;
        windowSubTextFgOver: #878787;
        windowBoldFg: #cdcdcd;
        windowBoldFgOver: #cdcdcd;
        windowBgActive: #6e94b2;
        windowFgActive: #141415;
        windowActiveTextFg: #6e94b2;
        windowShadowFg: #0a0a0b;
        windowShadowFgFallback: #141415;

        // Sidebar
        sideBarBg: #141415;
        sideBarBgActive: #1c1c24;
        sideBarBgRipple: #252530;
        sideBarTextFg: #cdcdcd;
        sideBarTextFgActive: #cdcdcd;
        sideBarIconFg: #878787;
        sideBarIconFgActive: #6e94b2;
        sideBarShadow: #0a0a0b;

        // Chat list
        dialogsBg: #141415;
        dialogsFgActive: #cdcdcd;
        dialogsNameFg: #cdcdcd;
        dialogsNameFgActive: #cdcdcd;
        dialogsChatIconFg: #878787;
        dialogsChatIconFgActive: #cdcdcd;
        dialogsDateFg: #606079;
        dialogsDateFgActive: #878787;
        dialogsTextFg: #606079;
        dialogsTextFgActive: #878787;
        dialogsTextFgService: #7fa563;
        dialogsTextFgServiceActive: #99b782;
        dialogsDraftFg: #d8647e;
        dialogsDraftFgActive: #e08398;
        dialogsVerifiedIconBg: #6e94b2;
        dialogsVerifiedIconFg: #141415;
        dialogsUnreadBg: #6e94b2;
        dialogsUnreadBgMuted: #333738;
        dialogsUnreadFg: #141415;
        dialogsBgOver: #1c1c24;
        dialogsBgActive: #252530;
        dialogsRippleBg: #252530;
        dialogsRippleBgActive: #333738;

        // Chat
        historyBg: #141415;
        historyScrollBarColor: #252530;
        historyScrollBarColorOver: #333738;
        historyScrollBg: #141415;
        historyScrollBgOver: #1c1c24;

        // Messages
        msgBg: #1c1c24;
        msgShadow: #0a0a0b;
        msgServiceBg: #252530;
        msgServiceFg: #cdcdcd;
        msgInBg: #1c1c24;
        msgInBgSelected: #252530;
        msgOutBg: #252540;
        msgOutBgSelected: #333750;
        msgInShadow: #0a0a0b;
        msgOutShadow: #0a0a0b;
        msgInDateFg: #606079;
        msgOutDateFg: #606079;
        msgInDateFgSelected: #878787;
        msgOutDateFgSelected: #878787;
        msgServiceColor: #cdcdcd;
        msgServiceBgSelected: #333738;

        // Input
        inputBg: #1c1c24;
        inputBgOver: #252530;
        inputBorderFg: #333738;
        inputBorderActive: #6e94b2;

        // Buttons
        activeButtonBg: #6e94b2;
        activeButtonBgOver: #8ba9c1;
        activeButtonBgRipple: #405065;
        activeButtonFg: #141415;
        activeButtonFgOver: #141415;
        activeButtonSecondaryFg: #141415;
        activeButtonSecondaryFgOver: #141415;
        activeLineFg: #6e94b2;
        activeLineFgError: #d8647e;

        lightButtonBg: #1c1c24;
        lightButtonBgOver: #252530;
        lightButtonBgRipple: #333738;
        lightButtonFg: #6e94b2;
        lightButtonFgOver: #8ba9c1;

        // Scrollbar
        scrollBarBg: #252530;
        scrollBarBgOver: #333738;
        scrollBg: #141415;
        scrollBgOver: #1c1c24;

        // Misc
        mentionFg: #bb9dbd;
        mentionFgOver: #c9b1ca;
        mentionFgActive: #bb9dbd;
        mentionBg: #1c1c24;
        mentionBgOver: #252530;
        mentionBgActive: #252530;

        linkFg: #7e98e8;
        checkmarkFg: #7fa563;
        sliderBgInactive: #333738;
        sliderBgActive: #6e94b2;
        EOF
        cp $out/colors.tdesktop-theme $out/vague.tdesktop-theme
      '';
    };
  };
}
