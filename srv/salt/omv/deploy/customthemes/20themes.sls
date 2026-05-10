{% set config = salt['omv_conf.get']('conf.system.customthemes') %}

customthemes_create_theme_css:
  file.managed:
    - name: /var/www/openmediavault/theme.css
    - source:
      - salt://{{ tpldir }}/files/var-www-openmediavault-theme-css.j2
    - template: jinja
    - context:
        config: {{ config | json }}
    - user: root
    - group: root
    - mode: '0644'