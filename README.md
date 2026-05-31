# owo93's neovim flake

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
Modules passed under `modules/` are discovered automatically through [import-tree](https://github.com/denful/import-tree)
```
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
