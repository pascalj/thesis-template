{
  description = "thesis";

    inputs = {
    nixpkgs.url = github:NixOS/nixpkgs/22.11;
    flake-utils.url = github:numtide/flake-utils;
  };

  outputs = { self, nixpkgs, flake-utils }:
    with flake-utils.lib; eachSystem allSystems (system:
    let
      pkgs = nixpkgs.legacyPackages.${system};
      tex = pkgs.texlive.combine {
        inherit (pkgs.texlive)
        scheme-basic
        latex-bin
        latexmk

        # Add tex packages below
        biber
        biblatex
        booktabs
        caption
        cleveref
        courier
        ec
        enumitem
        environ
        etoolbox
        fancyvrb
        float
        fontaxes
        footnotehyper
        graphics
        ifoddpage
        import
        inter
        koma-script
        listings
        mathtools
        multirow
        ms
        pgf
        preview
        relsize
        subfig
        transparent
        xkeyval
        xpatch
        xstring;
      };
    in rec {
      packages = {
        document = pkgs.stdenvNoCC.mkDerivation rec {
          name = "thesis";
          src = self;
          buildInputs = [
            # Add packages below
            pkgs.bash
            pkgs.coreutils
            pkgs.gnumake
            pkgs.gnused
            pkgs.graphviz-nox
            pkgs.dot2tex
            pkgs.haskellPackages.pandoc-crossref
            pkgs.inkscape
            pkgs.pandoc
            pkgs.pandoc-fignos
            pkgs.python3
            pkgs.python310Packages.numpy
            pkgs.python310Packages.matplotlib
            pkgs.R
            pkgs.rPackages.ggplot2
            pkgs.rPackages.tidyverse
            pkgs.rPackages.tikzDevice
            tex
          ];
          phases = ["unpackPhase" "buildPhase" "installPhase"];
          buildPhase = ''
            export PATH="${pkgs.lib.makeBinPath buildInputs}";
            export HOME="$TMP" ;
            export FONTCONFIG_FILE="${pkgs.fontconfig.out}/etc/fonts/fonts.conf";
            export FONTCONFIG_PATH="${pkgs.fontconfig.out}/etc/fonts/";
            mkdir -p .cache/texmf-var
            mkdir -p .config/inkscape
            env TEXMFHOME=.cache TEXMFVAR=.cache/texmf-var \
              make
          '';
          installPhase = ''
            mkdir -p $out
            cp thesis.pdf $out/
          '';
        };
      };
      defaultPackage = packages.document;
    });
}
