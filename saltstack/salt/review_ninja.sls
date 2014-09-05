grunt-cli:
  npm.installed

bower:
  npm.installed

ruby2.0:
  pkg.installed

scss-lint:
  gem.installed:
  - require:
    - pkg: ruby2.0

python-pip:
  pkg.installed:
    - require:
      - gem: scss-lint

pre-commit:
  pip.installed:
    - require:
      - pkg: python-pip

mongodb_present:
  mongodb_user.present:
    - name: reviewninja
    - passwd: reviewninja
    - database: reviewninja
    - host: "127.0.0.1"
    - port: 27017

mongodb_user_present:
  mongodb_user.present:
    - name: reviewninja
    - passwd: reviewninja
    - host: "127.0.0.1"
    - port: 27017
    - require:
      - mongodb_user: mongodb_present
