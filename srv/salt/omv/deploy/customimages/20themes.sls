{% set config = salt['omv_conf.get']('conf.system.customimages') %}

customimages_themes:
  file.managed:
    - name: /var/www/openmediavault/theme.css
    - source:
      - salt://{{ tpldir }}/files/var-www-openmediavault-theme-css.j2
    - template: jinja
    - context:
        config: {{ config | json }}
    - user: root
    - group: root
    - mode: 644