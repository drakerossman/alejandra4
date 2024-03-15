Originally published at [drakerossman.com - How to Patch a Package Source on NixOS](https://drakerossman.com//blog/how-to-patch-a-package-source-on-nixos).

This is the supplementary code for the article describing how to patch the sources of `alejandra` nix code formatter, so it uses 4-space indent instead of 2-space. The resulting application is named `alejandra4`.

`alejandra` is a nix code formatter written in Rust by Kevin Amado (kamadorueda). The source code is available at [https://github.com/kamadorueda/alejandra](https://github.com/kamadorueda/alejandra/).