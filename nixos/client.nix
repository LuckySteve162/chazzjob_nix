services.filebeat = {
    enable = true;
    settings = {
      filebeat.inputs = [{
        type = "log";
        enabled = true;
        paths = [ "/var/log/*.log" ];
      }];
      output.logstash = {
        hosts = [ "chazzjob.com:5044" ];
      };
    };
};

