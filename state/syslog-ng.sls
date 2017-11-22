syslog-ng:
  pkg.installed: []

set_variables:
  module.run:
    - name: syslog_ng.set_parameters
    - version: "3.6"
    - config_file: "/etc/syslog-ng/syslog-ng.conf"

options.global_options:
  syslog_ng.config:
    - config:
      - time_reap: 30
      - mark_freq: 10
      - keep_hostname: "yes"

source.s_localhost:
  syslog_ng.config:
    - config:
      - tcp:
        - ip: "127.0.0.1"
        - port: 1233

destination.d_log_server:
  syslog_ng.config:
    - config:
      - tcp:
        - "10.4.1.25"
        - port: 1234

log.l_log_to_central_server:
  syslog_ng.config:
    - config:
      - source: s_localhost
      - destination: d_log_server