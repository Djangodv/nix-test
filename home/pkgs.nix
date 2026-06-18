{ pkgs, ... }:
{
    home.packages = with pkgs; [
        spotify
        gimp
        tldr
        ripgrep
        fzf
        anki
        x11docker
        zip
        # lutris
        libreoffice-qt # Qt framework is better suited for KDE Plasma
        pandoc
        texliveSmall
        kdePackages.kdenlive # Video editor
        kdePackages.filelight
        # mc

        # Add required runtime libraries needer for yzane.markdown-pdf
        nodejs
        glib  
        libxkbcommon
    ];
}