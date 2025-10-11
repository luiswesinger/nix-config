# /path/to/your/project/flake.nix
{
  description = "EXAMPLE project environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs";

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          (pkgs.python3.withPackages (p: with p; [
            # all Python packages needed in the project
            pandas
            numpy
            matplotlib
            scikit-learn
            scipy
            seaborn
            statsmodels
            tensorflow
            ipykernel
          ]))
        ];

        shellHook = ''
          echo "using nix flake shell"
          echo "Python path: $(which python3)"
          python3 -m ipykernel install --user --name ml-nix --display-name "EXAMPLE-nixflake" --replace
        '';
      };
    };

    # -- USING THIS FLAKE ---------------
    # This Flake creates an ipykernel "EXAMPLE-nixflake" with all the packages declared above.
    # Replace the project name, select the kernel in your editor (e.g. vscode) and start working.
}

