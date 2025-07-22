{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Rust toolchain
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
  ];

  # Set environment variables
  shellHook = ''
    echo "Rust development environment loaded!"
    echo "Rust version: $(rustc --version)"
    echo "Cargo version: $(cargo --version)"

    # add cargo bin to path
    export PATH="$PATH:~/.cargo/bin"
    
    # Optional: set RUST_BACKTRACE for better error messages
    export RUST_BACKTRACE=1
  '';
}
