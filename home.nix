{ config, pkgs, inputs,... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  home.username = "yztangent";
  # manage.
  home.homeDirectory = "/home/yztangent";

  imports = [
    ./modules/alacritty.nix
    ./modules/btop.nix
    ./modules/eza.nix
    ./modules/fish.nix
    ./modules/fuzzel.nix
    ./modules/git.nix
    ./modules/nerdfont.nix
    ./modules/starship.nix
    ./modules/swaylock.nix
    ./modules/zoxide.nix
  ];
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # Enable necessary packages
  programs.waybar.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Screen brightness Manager
    brightnessctl

    # Communications
    telegram-desktop
    discord

    # Wallpaper
    swaybg

    # Zen browser
    (
      inputs.zen-browser.packages."${system}".default.override {
        nativeMessagingHosts = [pkgs.firefoxpwa];
      }
    )

    code-cursor

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # Moved dotfiles back to dotfiles repo and stow
    # ".config/niri" = {
    #   source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/niri;
    #   recursive = true;
    # };
    #
    # ".config/waybar" = {
    #   source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/waybar;
    #   recursive = true;
    # };


    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/yztangent/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
