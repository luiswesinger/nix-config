# /home/apps/unixtools.nix

{ pkgs, ...}:

{
  home.packages = with pkgs; [
    unixtools.top      # Display Linux processes
    unixtools.ping     # Send ICMP ECHO_REQUEST to network hosts
    unixtools.watch    # Execute a program periodically, showing output fullscreen
    unixtools.whereis  # Locate the binary, source, and manual page files for a command
    unixtools.netstat  # Print network connections, routing tables, interface statistics, etc.
    unixtools.ifconfig # Configure a network interface
    unixtools.arp      # Manipulate the system ARP cache
    unixtools.xxd      # Make a hexdump or do the reverse
    unixtools.column   # Columnate lists
  ];
}
