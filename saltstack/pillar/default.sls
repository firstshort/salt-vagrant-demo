# Default pillar values
{% if grains['os_family'] == 'RedHat' %}
apache: httpd
git: git
{% elif grains['os_family'] == 'Debian' %}
apache: apache2
git: git-core
{% endif %}
#ROLES
{% if grains['id'] in ['minion1', 'minion3' ] %}
role: web
{% elif grains['id'] in [ 'minion2' ]%}
role: lb
{% endif %}


editor: vi

{% set managed_text = '#Salt managed: File modified on ' + salt.cmd.run('date "+%Y-%m-%d %H:%M:%S"') %}

salt_managed: {{ managed_text | yaml_dquote }}
