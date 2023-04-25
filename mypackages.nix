let
  # Pinning explicitly to 20.03.
  rev = "f5364316e314436f6b9c8fd50592b18920ab18f9";
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/archive/${rev}.tar.gz";
  pkgs = import nixpkgs {};
in with pkgs; [
  texlive.combined.scheme-full
  asymptote
]
