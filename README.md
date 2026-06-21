# owo93's neovim flake

![built with nix](https://img.shields.io/badge/-Built%20with%20Nix-darkslateblue)
![GitHub License](https://img.shields.io/badge/license-MIT-blue)

My personal neovim flake, built with [NVF](https://nvf.notashelf.dev). Intended
to be distributed and installed as a Home-Manager package.

```text
<─. (`─')_      (`─')  _     <─. (`─')  
   ╲( OO) )    _(nix ) (_)       ╲(OO )_ 
,──.╱ ,──╱,──.(_╱,─.╲ ,─(`─'),──.╱  ,─.)
│   ╲ │  │╲   ╲ ╱ (_╱ │ ( OO)│   `.'   │
│  . '│  │)╲   ╱   ╱  │  │  )│  │'.'│  │
│  │╲    │_ ╲     ╱_)(│  │_╱ │  │   │  │
│  │ ╲   │╲─'╲   ╱    │  │'─>│  │   │  │
`──'  `──'    `─'     `──'   `──'   `──'
```

## Usage

Run it directly:

```bash
nix run github:owo93/nvf
```

## Installation

Add this flake to your `inputs`:

```nix
inputs.nvf = {
    url = "github:owo93/nvf.git?refs=main";
    inputs.nixpkgs.follows = "nixpkgs";
};
```

Pass `inputs` to Home-Manager's config through `extraSpecialArgs`:

```nix
homeConfigurations."o93" = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;

    extraSpecialArgs = {
        inherit inputs;
    };

    modules = [ ./home.nix ];
};
```

Install the package as a Home-Manager module:

```nix
{ pkgs, inputs, ... }: {
    home.packages = [
        inputs.nvf.packages.${pkgs.system}.default
    ];
}
```

## Module Layout

Modules passed under `modules/` are discovered automatically through
[import-tree](https://github.com/denful/import-tree)

```text
├── README.md
├── flake.lock
├── flake.nix
└── modules
    ├── core
    ├── languages       
    ├── plugins         
    ├── themes          
    └── ui
```
