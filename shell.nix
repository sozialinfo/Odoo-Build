{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    docker
    postgresql
    python3
    wkhtmltopdf
    python3.pkgs.pip
  ];
  shellHook = ''
    alias task='./task'
    zsh
  '';
}
