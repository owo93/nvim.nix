# owo93's neovim flake

![built with nix](https://img.shields.io/badge/-Built%20with%20Nix-darkslateblue)
![MIT License](https://img.shields.io/badge/license-MIT-blue)

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

```console
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

## Layout

Configuration modules under `nvim/` are discovered automatically through
[import-tree](https://github.com/denful/import-tree), grouped by concern:

```text
├── README.md
├── flake.lock
├── flake.nix
├── nix              # flake-parts modules (packaging, devshell, checks)
└── nvim             # nvf configuration modules
    ├── code         # LSP and completion
    ├── core         # editor options and global keymaps
    ├── editor       # editing and navigation
    ├── integrations # git, schemastore, wakatime
    ├── languages    # per-language configuration
    └── ui           # appearance and notifications
```
