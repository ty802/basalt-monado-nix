{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    basalt-src = {
        url= "git+https://gitlab.freedesktop.org/mateosss/basalt.git?submodules=1";
        flake= false;
        };
        flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, basalt-src, flake-utils }: 
    flake-utils.lib.eachDefaultSystem (system: let pkgs = import nixpkgs { system = system; }; 
    in {
    packages.default = pkgs.stdenv.mkDerivation {
    name = "basalt-monado";
    src = basalt-src;
    nativeBuildInputs = with pkgs; [
    cmake
    ninja
    git
    ];
    buildInputs = with pkgs; [
        eigen
        glew
        libpng
        lz4
        bzip2
        boost
        gtest
        opencv
        libpng
        lz4
        bzip2
        libuvc
        fmt
        python3
	tbb	
    ];

    };
    }
    );
}
