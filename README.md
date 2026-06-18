## NixOS configuration

### OS installation

Use `fdisk` to setup three different patitions on `/dev/sdX`:

1. EFI system partition
2. Swap partition
3. File system (Linux filesystem)

> Use `GPT` (eufi)

**Sources:**
1. https://linuxmind.dev/2025/09/02/how-to-install-the-operating-system-nixos/
2. https://www.youtube.com/watch?v=63sSGuclBn0&list=PLuRxZ95-8LY1mlotZMYGYib5sXJRw1RxW&index=1
3. https://nixos.wiki/wiki/NixOS_Installation_Guide#Legacy_bios_boot

### Setup

Run the following command inside `~/Github/nixos/`:

    sudo nixos-rebuild switch --flake .#nixos-demo

### Updating the system

I'm trying to piece together how to update my NixOS system that uses a flake.nix and this is where I've come at, but I need to know if its correct and I've got a few questions:
First this updates the system packages and other software used:
nix flake update
which I apply with:
sudo nixos-rebuild switch --upgrade --flake ~/Github/nixos#nixos-demo
That updates the packages in the system, now to update the nixos channel used I edit:
{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05"; # update version
    ...
  };
  ...
}
In flake.nix and then once again update with flake update and rebuild with the same command.
My questions are: is this correct? what does --upgrade do in the nixos-rebuild switch command?
But my point is still valid both have different functionality e.g. if I don't want to upgrade my whole system but just its packages I use nix flake update and else I edit flake.nix?
Also you're advice is to never use --upgrade correct?
So the real advice is: Use nix flake update explicitly (without --upgrade) so you have clear control over when you're updating versions versus when you're just rebuilding with existing locked versions. This gives you the flexibility you're describing.