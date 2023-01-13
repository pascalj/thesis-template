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
        koma-script
        pgf
        inter
        xkeyval
        fontaxes
        xpatch
        etoolbox
        transparent
        acronym
        bigfoot
        xstring
        float
        mathtools
        algorithm2e
        ifoddpage
        relsize
        todonotes
        listings
        import
        tcolorbox
        siunitx
        caption
        enumitem
        fancyhdr
        environ
        multirow
        booktabs
        biblatex
        courier
        fancyvrb
        subfig
        footnotehyper
        cleveref
        biber;
      };
    in rec {
      packages = {
        document = pkgs.stdenvNoCC.mkDerivation rec {
          name = "thesis";
          src = self;
          buildInputs = [
            pkgs.coreutils
            pkgs.bash
            tex
            pkgs.gnumake
            pkgs.inkscape
            pkgs.graphviz-nox
            pkgs.pandoc
            pkgs.gnused
            pkgs.python3
            pkgs.haskellPackages.pandoc-crossref
            pkgs.pandoc-fignos
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
