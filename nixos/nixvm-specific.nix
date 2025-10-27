{ config, pkgs, ... }
{
  users.users.luckytest = {
    isSystemUser = true;
    initialPassword = "test";
    group = "luckytest";
  };
  

}
