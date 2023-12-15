{ pkgs
, lib
, config
, ...
}:
with lib; let
  cfg = config.modules.hyprland;
in
{
  options.modules.hyprland.enable = mkEnableOption "hyprland";

  config = mkMerge [
    (mkIf cfg.enable {
      home.packages = with pkgs; [
        cliphist
        hyprpaper
        hyprpicker
        wofi-emoji
        waybar
        eww-wayland
        nwg-look
      ];
    })
  ];
}