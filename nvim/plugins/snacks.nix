{
  vim = {
    utility = {
      snacks-nvim = {
        enable = true;
        setupOpts = {
          git.enabled = true;
          dashboard = {
            enabled = true;
            preset = {
              header = ''
                <─. (`─')_      (`─')  _     <─. (`─')  
                   ╲( OO) )    _(nix ) (_)       ╲(OO )_ 
                ,──.╱ ,──╱,──.(_╱,─.╲ ,─(`─'),──.╱  ,─.)
                │   ╲ │  │╲   ╲ ╱ (_╱ │ ( OO)│   `.'   │
                │  . '│  │)╲   ╱   ╱  │  │  )│  │'.'│  │
                │  │╲    │_ ╲     ╱_)(│  │_╱ │  │   │  │
                │  │ ╲   │╲─'╲   ╱    │  │'─>│  │   │  │
                `──'  `──'    `─'     `──'   `──'   `──'
              '';
            };
            sections = [
              { section = "header"; }
              {
                title = "Git Status";
                section = "terminal";
                cmd = "git rev-parse --git-dir > /dev/null 2>&1 && git status --short --branch --renames || echo 'Git status unavailable\n, are you in a git repository?'";
                height = 3;
                padding = 1;
                ttl = 3 * 60;
                inden = 3;
              }
              {
                title = "Projects";
                section = "projects";
                indent = 2;
                padding = 1;
              }
              {
                title = "Recents";
                section = "recent_files";
                indent = 2;
                limit = 5;
                padding = 1;
              }
            ];
          };
        };
      };
    };
  };
}
