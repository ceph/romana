{% import 'setvars' as vars with context %}
build_romana:
  cmd.run:
    - name: make rpm
    - user: {{vars.username}}
    - cwd: {{vars.builddir}}/{{vars.gitname}}
{%- if vars.username == 'vagrant' %}
    - require:
      - git: git_clone
{%- endif %}

copy_romana:
  cmd.run:
    - name: cp rpmbuild/RPMS/x86_64/romana*.rpm {{vars.pkgdest}}
    - cwd: {{vars.builddir}}
    - require:
      - cmd: build_romana

