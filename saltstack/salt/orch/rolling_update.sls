{% for web_server in salt.saltutil.runner('mine.get',
                          tgt='roles:web', 
                          fun='network.ip_addrs', 
                          tgt_type='grain')  %}
  {% for lb_server in salt.saltutil.runner('mine.get',
                            tgt='roles:lb', 
                            fun='network.ip_addrs', 
                            tgt_type='grain')  %}
    disable_{{ web_server }}_in_haproxy:
      salt.function:
        - name: cmd.shell
        - tgt: '{{ lb_server }}'
        - arg:
          - echo "disable server episode46/minion1" | socat stdio /var/lib/haproxy/stats

    deploy_web_content_{{ web_server }}:
      salt.state:
        - tgt: {{ web_server }}
        - sls: web

    enable_{{ web_server }}_in_haproxy:
      salt.function :
        - name: cmd.shell
        - tgt: '{{ lb_server }}'
        - arg:
          - echo "enable server episode46/minion1" | socat stdio /var/lib/haproxy/stats

  {% endfor %}
{% endfor %}

