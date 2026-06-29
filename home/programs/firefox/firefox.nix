{ pkgs, lib, config, cfg, ... }:
{

  home.file.".mozilla/firefox/default/places.sqlite" = {
    source = config.lib.file.mkOutOfStoreSymlink "${cfg.projectRoot}/home/programs/firefox/bookmarks/places.sqlite";
    force = true;
  };

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-esr;
    # configPath = "${config.xdg.configHome}/mozilla/firefox";
    configPath = ".mozilla/firefox";
    policies = {
      "3rdparty".Extensions = {
        "uBlock0@raymondhill.net".adminSettings = {
          userSettings = {
            importedLists = [];
          };
          # Source: https://www.reddit.com/r/firefox/comments/1dt5yte/you_should_know_the_extension_still_dont_care/
          selectedFilterLists = [
            "user-filters"
            "ublock-filters"
            "ublock-badware"
            "ublock-privacy"
            "ublock-quick-fixes"
            "ublock-unbreak"
            "easylist"
            "easyprivacy"
            "adguard-spyware-url"
            "urlhaus-1"
            "plowe-0"
            "adguard-cookies"
            "ublock-cookies-adguard"
            "adguard-mobile-app-banners"
            "adguard-other-annoyances"
            "adguard-popup-overlays"
            "adguard-widgets"
            "ublock-annoyances"
          ];
        };
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          private_browsing = true;
        };
        "{446900e4-71c2-419f-a6a7-df9c091e268b}" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/bitwarden-password-manager/latest.xpi";
          private_browsing = true; 
        };
        "myallychou@gmail.com" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/youtube-recommended-videos/latest.xpi";
          private_browsing = true; 
        };
        "vimium-c@gdh1995.cn" = {
          installation_mode = "normal_installed";
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/vimium-c/latest.xpi";
          private_browsing = true; 
        };
      };
      ExtensionUpdate = true;
      # Homepage = {
      #   Locked = true;
      #   StartPage = "none";
      # };
      NewTabPage = false;
      PictureInPicture = {
        Enabled = false;
      };
      SearchSuggestEnabled = false;
      OfferToSaveLogins = false;
      DisableFormHistory = true;
      FirefoxSuggest = {
        WebSuggestions = false;
        SponsoredSuggestions = false;
        ImproveSuggest = false;
        Locked = true;
      };
      DisableFirefoxStudies = true;
      DisableFirefoxAccounts = true;
      DisablePocket = true;
      DontCheckDefaultBrowser = true;
      DisableTelemetry = true;
      NoDefaultBookmarks = true;
      PasswordManagerEnabled = false;
      DisplayBookmarksToolbar = "never";
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboardin = false;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };
      GenerativeAI = {
        Enabled = false;
        Locked = true;
      };
    };
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      search = {
        force = true;
        default = "ddg-no-ai";
        privateDefault = "ddg-no-ai";
        engines = {

          ddg-no-ai = {
            name = "DuckDuckGo No-AI";
            urls = [{ template = "https://noai.duckduckgo.com/?q={searchTerms}"; }];
            iconMapObj."16" = "https://noai.duckduckgo.com/favicon.ico";
            definedAliases = [ "@ddg" "@duckduckgo" ];
          };

          stack-overflow = {
            name = "Stack Overflow";
            urls = [{ template = "https://noai.duckduckgo.com/?q={searchTerms}+site%3Astackoverflow.com"; }];
            iconMapObj."16" = "https://stackoverflow.com/favicon.ico";
            definedAliases = [ "@so" "@stackoverflow" ];
          };

          # Stack Exchange
          stack-exchange = {
            name = "Stack Exchange";
            urls = [{ template = "https://noai.duckduckgo.com/?q={searchTerms}+site%3Astackexchange.com"; }];
            iconMapObj."16" = "https://stackexchange.com/favicon.ico";
            definedAliases = [ "@se" "@stackexchange" ];
          };

          # Nix Packages
          nix-packages = {
            name = "Nix Packages";
            urls = [{ template = "https://search.nixos.org/packages?&query={searchTerms}"; }];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@np" "@nix-packages" "@nixp" ];
          };

          # Nix Options
          nix-options = {
            name = "Nix Options";
            urls = [{ template = "https://search.nixos.org/options?&query={searchTerms}"; }];
            iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
            definedAliases = [ "@no" "@nix-options" "@nixo" ];
          };

          # Reddit
          reddit = {
            name = "Reddit";
            urls = [{ template = "https://noai.duckduckgo.com/?q={searchTerms}+site%3Areddit.com"; }];
            iconMapObj."16" = "https://reddit.com/favicon.ico";
            definedAliases = [ "@re" "@reddit" ];
          };

          # Marginalia Search
          marginalia = {
            name = "Marginalia Search";
            urls = [{ template = "https://marginalia-search.com/search?query={searchTerms}"; }];
            iconMapObj."16" = "https://marginalia-search.com/favicon.ico";
            definedAliases = [ "@mar" "@mg" ];
          };

          github-repo = {
            name = "Github Repositories";
            urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
            iconMapObj."16" = "https://github.com/favicon.ico";
            definedAliases = [ "@gh" "@github" ];
          };

          github-personal = {
            name = "Personal Repositories";
            urls = [{ template = "https://github.com/search?q=owner%3ADjangodv+{searchTerms}"; }];
            iconMapObj."16" = "https://github.com/favicon.ico";
            definedAliases = [ "@gp" "@ghp" "@github-personal" ];
          };

          # Hide specific search engines
          ddg.metaData.hidden = true;
          bing.metaData.hidden = true;
          ebay-nl.metaData.hidden = true;
          perplexity.metaData.hidden = true;
          qwant.metaData.hidden = true;

        };
      };
      settings = {

        # Fixes Vimium extension not working upon startup inside a blank Firefox page
        "browser.startup.homepage" = "https://noai.duckduckgo.com/";

        # Sanitize on shutdown settings
        "privacy.clearOnShutdown.cache" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "privacy.clearOnShutdown.formdata" = true;
        "privacy.clearOnShutdown.history" = true;
        "privacy.clearOnShutdown.sessions" = false;
        "privacy.clearOnShutdown.siteSettings" = false;

        # Session restoration
        "browser.startup.page" = 3;

        # Enable vertical tabs
        "sidebar.revamp" = true;
        "sidebar.verticalTabs" = true;
        "sidebar.main.tools" = "";
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.suggest.topsites" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        # See https://librewolf.net/docs/faq/#how-do-i-fully-prevent-autoplay for options
        "media.autoplay.blocking_policy" = 2;
        # Directly enable compact mode
        "browser.uidensity" = 1;
        # "browser.compactmode.show" = true;
        "browser.aboutConfig.showWarning" = false;
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.uiCustomization.state" = {
          "placements" = { 
            "widget-overflow-fixed-list" = []; 
            "unified-extensions-area" = ["myallychou_gmail_com-browser-action" "vimium-c_gdh1995_cn-browser-action" "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action" ]; 
            "nav-bar" = [ "sidebar-button" "back-button" "forward-button" "urlbar-container" "vertical-spacer" "unified-extensions-button"  "ublock0_raymondhill_net-browser-action"]; 
            "toolbar-menubar" = [ "menubar-items" ]; 
            "TabsToolbar" = []; 
            "vertical-tabs" = ["tabbrowser-tabs"]; 
            "PersonalToolbar" = ["personal-bookmarks"]; 
          }; 
          "seen" = [ "developer-button" "myallychou_gmail_com-browser-action" "ublock0_raymondhill_net-browser-action" "vimium-c_gdh1995_cn-browser-action" "_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action" "screenshot-button"];
          "dirtyAreaCache" = [ "nav-bar" "TabsToolbar" "vertical-tabs" "unified-extensions-area" ]; 
          "currentVersion" = 22; 
          "newElementCount" = 1;
        };
      };
    };
  };
}

# Sources for configuration:
# - https://nix-community.github.io/home-manager/options.xhtml
# - https://gitlab.com/usmcamp0811/dotfiles/-/blob/fb584a888680ff909319efdcbf33d863d0c00eaa/modules/home/apps/firefox/default.nix
# - https://github.com/Misterio77/nix-config/blob/main/home/gabriel/features/desktop/common/firefox.nix
# - https://github.com/Kreyren/nixos-config/blob/bd4765eb802a0371de7291980ce999ccff59d619/nixos/users/kreyren/home/modules/web-browsers/firefox/firefox.nix#L116-L148 
