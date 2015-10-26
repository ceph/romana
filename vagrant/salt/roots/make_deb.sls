{% import 'setvars' as vars with context %}
devscripts:
  pkg.installed

build_romana:
  cmd.run:
    - user: {{vars.username}}
    - name: make dpkg
    - cwd: {{vars.builddir}}/{{vars.gitname}}
    - require:
{%- if vars.username == 'vagrant' %}
      - git: git_clone
{%- endif %}
      - pkg: devscripts

{% if vars.username == 'vagrant' %}
copy_romana:
  cmd.run:
    - name: cp romana*.deb {{vars.pkgdest}}
    - cwd: {{vars.builddir}}
    - require:
      - cmd: build_romana
{% endif %}
