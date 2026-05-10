run_customthemes_script:
  cmd.run:
    - name: patchomv-customthemes
    - require:
      - file: configure_customthemes
