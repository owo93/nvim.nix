{
  vim = {
    utility = {
      snacks-nvim = {
        enable = true;
        setupOpts = {
          indent.enabled = true;
          dashboard = {
            enabled = true;
            preset = {
              header = ''
                <-. (`-')_      (`-')  _     <-. (`-')
                   \( OO) )    *(OO ) (*)       \(OO )_
                ,--./ ,--/,--.(_/,-.\ ,-(`-'),--./  ,-.)
                |   \ |  |\   \ / (_/ | ( OO)|   `.'   |
                |  . '|  |)\   /   /  |  |  )|  |'.'|  |
                |  |\    |_ \     /_)(|  |_/ |  |   |  |
                |  | \   |\-'\   /    |  |'->|  |   |  |
                `--'  `--'    `-'     `--'   `--'   `--'
              '';
            };
            sections = [
              { section = "header"; }
              {
                section = "keys";
                padding = 2;
              }

              {
                icon = " ";
                desc = "Browse Repo";
                padding = 1;
                key = "b";

                action = ''
                  function()
                    Snacks.gitbrowse()
                  end
                '';
              }

              {
                title = "Recents";
                section = "recent_files";
                indent = 2;
                limit = 8;
                padding = 1;
              }

            ];
          };
        };
      };
    };
  };
}
