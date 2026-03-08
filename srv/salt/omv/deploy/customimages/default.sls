{% set config = salt['omv_conf.get']('conf.system.customimages') %}

configure_customimages:
  file.managed:
    - name: /etc/customimages.conf
    - source:
      - salt://{{ tpldir }}/files/etc-customimages-conf.j2
    - template: jinja
    - context:
        config: {{ config | json }}
    - user: root
    - group: root
    - mode: 644

run_customimages_script:
  cmd.run:
    - name: patchomv-customimages
    - require:
      - file: configure_customimages
