# home/features/cli/btop.nix
{ config, pkgs, ... }:

let
  colors = config.colorScheme.palette;
in
{
  programs.btop = {
    enable = true;
    
    settings = {
      color_theme = "nix-colors";
      
      theme_background = false; 
      
      truecolor = true;
      rounded_corners = true;
      update_ms = 500;
    };
  };

  xdg.configFile."btop/themes/nix-colors.theme".text = ''
    # Main background 
    theme[main_bg]="#${colors.base00}"
    
    # Main text color
    theme[main_fg]="#${colors.base05}"
    
    # Title color for boxes
    theme[title]="#${colors.base05}"
    
    # Highlight color for keyboard shortcuts
    theme[hi_fg]="#${colors.base0D}"
    
    # Background color of selected item in processes box
    theme[selected_bg]="#${colors.base02}"
    
    # Foreground color of selected item in processes box
    theme[selected_fg]="#${colors.base05}"
    
    # Color of inactive/disabled text
    theme[inactive_fg]="#${colors.base03}"
    
    # Color of text appearing on top of graphs, i.e uptime
    theme[graph_text]="#${colors.base06}"
    
    # Misc colors for processes box including mini cpu graphs
    theme[proc_misc]="#${colors.base0C}"
    
    # Cpu box outline color
    theme[cpu_box]="#${colors.base0E}"
    
    # Memory/disks box outline color
    theme[mem_box]="#${colors.base0B}"
    
    # Net up/down box outline color
    theme[net_box]="#${colors.base0D}"
    
    # Processes box outline color
    theme[proc_box]="#${colors.base0A}"
    
    # Box divider line and small boxes line color
    theme[div_line]="#${colors.base01}"
    
    # Temperature graph colors (Grün -> Gelb -> Rot)
    theme[temp_start]="#${colors.base0B}"
    theme[temp_mid]="#${colors.base0A}"
    theme[temp_end]="#${colors.base08}"
    
    # CPU graph colors
    theme[cpu_start]="#${colors.base0D}"
    theme[cpu_mid]="#${colors.base0E}"
    theme[cpu_end]="#${colors.base08}"
    
    # Mem/Disk free meter
    theme[free_start]="#${colors.base0B}"
    theme[free_mid]="#${colors.base0B}"
    theme[free_end]="#${colors.base0B}"
    
    # Mem/Disk cached meter
    theme[cached_start]="#${colors.base0D}"
    theme[cached_mid]="#${colors.base0D}"
    theme[cached_end]="#${colors.base0D}"
    
    # Mem/Disk available meter
    theme[available_start]="#${colors.base0E}"
    theme[available_mid]="#${colors.base0E}"
    theme[available_end]="#${colors.base0E}"
    
    # Mem/Disk used meter
    theme[used_start]="#${colors.base08}"
    theme[used_mid]="#${colors.base08}"
    theme[used_end]="#${colors.base08}"
    
    # Download graph colors
    theme[download_start]="#${colors.base0B}"
    theme[download_mid]="#${colors.base0A}"
    theme[download_end]="#${colors.base08}"
    
    # Upload graph colors
    theme[upload_start]="#${colors.base0D}"
    theme[upload_mid]="#${colors.base0E}"
    theme[upload_end]="#${colors.base0C}"
    
    # Process box color gradient for threads, mem and cpu usage
    theme[process_start]="#${colors.base0B}"
    theme[process_mid]="#${colors.base0A}"
    theme[process_end]="#${colors.base08}"
  '';
}
