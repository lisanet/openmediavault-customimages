{% set config = salt['omv_conf.get']('conf.system.customthemes') %}
{% set default_dir = '/var/www/openmediavault/assets/images' %}
{% set image_dir = config.imagefolder %}
{% set wallpapers_enabled = config.wallpapers | to_bool %}

{% set image_types = ['login', 'standby', 'shutdown'] %}

{% for img_type in image_types %}
  {% set conf_key = img_type ~ 'image' %}
  {% set orig_file = img_type ~ '.jpg.distrib' %}
  {% set target_path = default_dir | path_join(img_type ~ '.jpg') %}
  {% if wallpapers_enabled and config.get(conf_key) %}
    {% set source_path = image_dir | path_join(config.get(conf_key)) %}
  {% else %}
    {% set source_path = default_dir | path_join(orig_file) %}
  {% endif %}

customthemes_apply_{{ img_type }}_image:
  file.copy:
    - name: {{ target_path }}
    - source: {{ source_path }}
    - force: True
    - preserve: True
    - unless:
      - cmp -s {{ source_path }} {{ target_path }}

{% endfor %}