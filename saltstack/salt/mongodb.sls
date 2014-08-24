mongodb_package:
  pkgrepo.managed:
    - humanname: MongoDB PPA
    - name: deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen
    - file: /etc/apt/sources.list.d/mongodb.list
    - keyid: 7F0CEB10
    - keyserver: keyserver.ubuntu.com
  pkg.installed:
    - pkgs: 
      - mongodb-org
      - python-pymongo
      - python-pymongo-ext

mongodb_db_path:
  file.directory:
    - name: /mongodb/data
    - user: mongodb
    - group: mongodb
    - mode: 755
    - makedirs: True

mongodb_log_path:
  file.directory:
    - name: /mongodb/log
    - user: mongodb
    - group: mongodb
    - mode: 755
    - makedirs: True

mongodb_service:
  service.running:
    - name: mongod
    - enable: True
    - watch:
      - file: mongodb_configuration

mongodb_configuration:
  file.managed:
    - name: /etc/mongodb.conf
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/mongodb.conf.jinja
    - template: jinja
