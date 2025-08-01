{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = false;
      format = lib.mkOverride 0 (
        "\n" +
        "[░▒▓](#a3aed2)" +
        "[ $os $username ](bg:#a3aed2 fg:#090c0c)" +
        "[](bg:#769ff0 fg:#a3aed2)" +
        "$directory" +
        "[](fg:#769ff0 bg:#394260)" +
        "$git_branch" +
        "$git_status" +
        "[](fg:#394260 bg:#212736)" +
        "$c" +
        "$rust" +
        "$golang" +
        "$nodejs" +
        "$php" +
        "$java" +
        "$kotlin" +
        "$haskell" +
        "$python" +
        "[](fg:#212736 bg:#1d2230)" +
        "$time" +
        "[ ](fg:#1d2230)" +
        "\n" +
        "$character" # Changed here: "\\n"
      );

      palette = "tokyo_night";

      palettes = {
        tokyo_night = {
          color_fg0 = "#fbf1c7";
          color_bg1 = "#3c3836";
          color_bg3 = "#665c54";
          color_blue = "#458588";
          color_aqua = "#689d6a";
          color_green = "#98971a";
          color_orange = "#d65d0e";
          color_purple = "#b16286";
          color_red = "#cc241d";
          color_yellow = "#d79921";
          color_grey = "#a3aed2";
          color_black = "#000000";
        };
      };

      os = {
        disabled = false;
        style = "bg:color_grey fg:color_black";
        symbols = {
          Windows = "󰍲";
          Ubuntu = "󰕈";
          SUSE = "";
          Raspbian = "󰐿";
          Mint = "󰣭";
          Macos = "󰀵";
          Manjaro = "";
          Linux = "󰌽";
          Gentoo = "󰣨";
          Fedora = "󰣛";
          Alpine = "";
          Amazon = "";
          Android = "";
          Arch = "󰣇";
          Artix = "󰣇";
          EndeavourOS = "";
          CentOS = "";
          Debian = "󰣚";
          Redhat = "󱄛";
          RedHatEnterprise = "󱄛";
          # Added Nix icon
          NixOS = ""; # Or ""
        };
      };

      username = {
        show_always = true;
        style_user = "bg:color_grey fg:color_black";
        style_root = "bg:color_grey fg:color_black";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:#e3e5e5 bg:#769ff0";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = " ";
          "Pictures" = " ";
          "code" = "󰲋 ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol $branch ](fg:#769ff0 bg:#394260)]($style)";
      };

      git_status = {
        style = "bg:#394260";
        format = "[[($all_status$ahead_behind )](fg:#769ff0 bg:#394260)]($style)";
      };

      c = {
        symbol = " ";
        style = "bg:#394260";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      rust = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      golang = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:#212736";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      java = {
        symbol = " ";
        style = "bg:#394260";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      kotlin = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      haskell = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      python = {
        symbol = "";
        style = "bg:#394260";
        format = "[[ $symbol ($version) ](fg:#769ff0 bg:#212736)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:#1d2230";
        format = "[[  $time ](fg:#a0a9cb bg:#1d2230)]($style)";
      };
    };
  };
}
