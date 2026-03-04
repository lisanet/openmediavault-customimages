{% set config = salt['omv_conf.get']('conf.service.customimages') %}

# 1) Konfigurationsdatei in /etc/openmediavault/ schreiben
configure_customimages:
  file.managed:
    - name: /etc/customimages.conf
    - contents: |
        LOGIN_IMAGE="{{ config['loginimage'] }}"
        LOGIN_BLENDMODE="{{ config['blendmode'] }}"
        STANDBY_IMAGE="{{ config['standbyimage'] }}"
        STANDBY_BLENDMODE="{{ config['standbyblendmode'] }}"
        SHUTDOWN_IMAGE="{{ config['shutdownimage'] }}"
        SHUTDOWN_BLENDMODE="{{ config['shutdownblendmode'] }}"
    - user: root
    - group: root
    - mode: 644

# 2) Dein Patch-Script aufrufen
run_customimages_script:
  cmd.run:
    - name: patchomv-customimages
    - require:
      - file: configure_customimages
