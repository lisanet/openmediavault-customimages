run_customimages_script:
  cmd.run:
    - name: patchomv-customimages
    - require:
      - file: configure_customimages
