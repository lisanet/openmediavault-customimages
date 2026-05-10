{% set config = salt['omv_conf.get']('conf.system.customthemes') %}

configure_customthemes:
  file.managed:
    - name: /etc/customthemes.conf
    - source:
      - salt://{{ tpldir }}/files/etc-customthemes-conf.j2
    - template: jinja
    - context:
        config: {{ config | json }}
    - user: root
    - group: root
    - mode: '0644'
