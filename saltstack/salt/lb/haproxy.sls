haproxy:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: haproxy
      - file: /etc/default/haproxy
      - file: /etc/haproxy/haproxy.cfg
#      - file: /etc/nginx/conf.d
#      - file: /usr/share/nginx/html/index.html

  file:
    - replace
    - name: /etc/default/haproxy
    - pattern: '^ENABLED.*$'  # comment goes here
    - repl: 'ENABLED=1'

/etc/haproxy/haproxy.cfg:
  file.managed:
    - source: salt://lb/haproxy/etc/haproxy/haproxy.cfg
    - user: root
    - group: root
    - file_mode: 644
    - template: jinja
