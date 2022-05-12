{
  description = ''Nim wrapper for Leopard-RS: a fast library for Reed-Solomon erasure correction coding'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."leopard-main".dir   = "main";
  inputs."leopard-main".owner = "nim-nix-pkgs";
  inputs."leopard-main".ref   = "master";
  inputs."leopard-main".repo  = "leopard";
  inputs."leopard-main".type  = "github";
  inputs."leopard-main".inputs.nixpkgs.follows = "nixpkgs";
  inputs."leopard-main".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."leopard-v0_0_1".dir   = "v0_0_1";
  inputs."leopard-v0_0_1".owner = "nim-nix-pkgs";
  inputs."leopard-v0_0_1".ref   = "master";
  inputs."leopard-v0_0_1".repo  = "leopard";
  inputs."leopard-v0_0_1".type  = "github";
  inputs."leopard-v0_0_1".inputs.nixpkgs.follows = "nixpkgs";
  inputs."leopard-v0_0_1".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}