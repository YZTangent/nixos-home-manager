# /etc/nixos/modules/alacritty.nix
{ ... }:

{
  # Enable the alacritty program for this user
  programs.alacritty = {
    enable = true;
    # Basic settings to get you started
    settings = {
      window = {
        padding = { x = 0; y = 0 ; };
        decorations = "None";
        opacity = 0.8; 
      };
      font = {
        normal.family = "JetBrainsMono Nerd Font";
        size = 9;
	# offset = {
	#   x = 0;
	#   y = 1;
	# };
      };
    };
  };

  # Set the default terminal for your user session
  home.sessionVariables = {
    TERMINAL = "alacritty";
  };
}
