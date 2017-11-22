syslog-ng:
  pkg.installed: []
  syslog_ng.config:
    - config:
      - tcp:
        - ip: "10.4.1.25"
        - port: 1233