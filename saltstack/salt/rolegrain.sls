roles:
  grains.present:
    - force: True
    - value: 
      - web
      - memcached
