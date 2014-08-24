review_ninja_repo:
  git.latest:
    - name: https://github.com/reviewninja/review.ninja.git
    - target: /home/vagrant/review.ninja
    - user: vagrant

grunt-cli:
  npm.installed

bower:
  npm.installed

ruby-compass:
  pkg.installed

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
