{% set config = salt['omv_conf.get']('conf.system.customimages') %}

customimages_colors:
  file.append:
    - name: /var/www/openmediavault/theme.css
    - source: salt://{{ tpldir }}/files/colors-css.j2
    - template: jinja
    - context:
        config: {{ config | json }}
    - require:
      - file: customimages_themes

{% if config.get('customcolor') %}
customimages_create_colors_css:
  cmd.run:
    - name: patchomv-customimages-colors

customimages_append_extra_styles:
  file.append:
    - name: /var/www/openmediavault/theme.css
    - sources: 
        - /usr/share/opnemediavault/customimages/colors.css
        - /var/lib/omv-customimages/styles-colors.css
    - onlyif: test -e /var/lib/omv-customimages/styles-colors.css
    - require:
      - cmd: customimages_create_colors_css
      - file: customimages_colors
{% endif %}
