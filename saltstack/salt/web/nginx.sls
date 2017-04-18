nginx:
  pkg:
    - installed
  service:
    - running
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf
      - file: /etc/nginx/sites-available/default
#      - file: /etc/nginx/conf.d
      - file: /usr/share/nginx/html/index.html

#/etc/nginx/globals:
#  file.recurse:
#    - source: salt://nginx/config/etc/nginx/globals
#    - user: root
#    - group: root
#    - file_mode: 644
#    - dir_mode: 755
#    - include_empty: True
#    - makedirs: True
#
#/etc/nginx/conf.d:
#  file.recurse:
#    - source: salt://nginx/config/etc/nginx/conf.d
#    - user: root
#    - group: root
#    - file_mode: 644
#    - dir_mode: 755
#    - include_empty: True
#    - makedirs: True
#
/etc/nginx/nginx.conf:
  file.managed:
    - source: salt://web/nginx/config/etc/nginx/nginx.conf
    - user: root
    - group: root
    - file_mode: 644
    - template: jinja

/etc/nginx/sites-available/default:
  file.managed:
    - source: salt://web/nginx/config/etc/nginx/sites-available/default
    - user: root
    - group: root
    - file_mode: 644
    - template: jinja

/usr/share/nginx/html/index.html:
  file.managed:
    - source: salt://index.html
#    - source: salt://web/nginx/config/usr/share/nginx/html/index.html
    - user: root
    - group: root
    - file_mode: 644
    - template: jinja

/usr/share/nginx/html/bootstrap.min.css:
  file.managed:
    - source: salt://bootstrap.min.css
    - user: root
    - group: root
    - file_mode: 644
