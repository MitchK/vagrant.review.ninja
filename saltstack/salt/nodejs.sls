curl:
  pkg.installed

node_repo:
  cmd:
    - run
    - name: curl -sL https://deb.nodesource.com/setup | sudo bash -
    - user: vagrant
    - require:
      - pkg: curl

nodejs:
  pkg.installed:
    - require:
      - cmd: node_repo
