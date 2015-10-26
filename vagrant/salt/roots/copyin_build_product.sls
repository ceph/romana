{% import 'setvars' as vars with context %}

copyin_build_product:
  cmd.run:
    - name: cp {{vars.pkgdest}}/romana*tar.gz {{vars.builddir}}/{{vars.gitname}}
    - user: {{vars.username}}
