{ stdenv, writeText, python, pkgs, dev }:

let
    generic = builtins.readFile ./vimrc/general.vim;
    haskell = pkgs.callPackage haskell/vimrc.nix {};
    javascript = pkgs.callPackage javascript/vimrc.nix {};
in

generic +
(pkgs.lib.optionalString dev ''
 " wakatime
 let g:wakatime_Binary = "${pkgs.wakatime}/bin/wakatime"
 ${haskell}
 ${javascript}
'')
