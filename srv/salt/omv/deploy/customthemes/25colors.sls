{% set config = salt['omv_conf.get']('conf.system.customthemes') %}

customthemes_colors:
  file.append:
    - name: /var/www/openmediavault/theme.css
    - source: salt://{{ tpldir }}/files/colors-css.j2
    - template: jinja
    - context:
        config: {{ config | json }}
    - require:
      - file: customthemes_create_theme_css

{% if config.get('customcolor') %}
customthemes_create_colors_css:
  cmd.run:
    - name: patchomv-customthemes-colors

customthemes_append_extra_styles:
  file.append:
    - name: /var/www/openmediavault/theme.css
    - sources: 
        - /usr/share/openmediavault/customthemes/colors.css
        - /var/lib/omv-customthemes/styles-colors.css
    - onlyif: test -e /var/lib/omv-customthemes/styles-colors.css
    - require:
      - cmd: customthemes_create_colors_css
      - file: customthemes_colors
{% endif %}
