{
  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = "Gen-Kn";
    userEmail = "157246690-Gen-Kn-users.noreply.github.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };
}
