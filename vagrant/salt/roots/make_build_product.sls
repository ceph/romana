{% import 'setvars' as vars with context %}
make_build_product:
  cmd.run:
    - user: {{vars.username}}
    - name: make build-product
    - env:
       - REAL_BUILD: 'y'
    - cwd: {{vars.builddir}}/{{vars.gitname}}
    - require:
      - cmd: build_romana

copyout_build_product:
   cmd.run:
     - user: {{vars.username}}
     - name: cp romana*tar.gz {{vars.pkgdest}}
     - cwd: {{vars.builddir}}/{{vars.gitname}}
     - require:
       - cmd: make_build_product
