Contribute to ReviewNinja
=========================

This is a vagrant box/salt provisioning to get you setup for developing on
ReviewNinja as quickly as possible.

Set up the environment
----------------------

You need to have [Virtualbox](https://www.virtualbox.org/) and
[Vagrant](https://www.vagrantup.com/) installed.

Once you have Virtualbox and Vagrant installed you can clone this repository
and run

	vagrant up

If you have not already used the ubuntu/trusty64 image with vagrant then it
will download it for you, spin up the machine and run
[salt](http://www.saltstack.com/) provisioning.

> If anything fails (network failure, or any other cause) just run `vagrant
> provision` and it will eventually get the machine into the correct state.

You can now ssh into the machine

	vagrant ssh

The app lies in `/home/vagrant/review.ninja` so `cd` into it.

	cd ~/review.ninja

Install npm and bower dependencies

	npm install
	bower install

Next copy the `.env.example` file to `.env`. (This is where the configuration
takes place)

	cp .env.example .env

You also need to [register an application on
GitHub](https://github.com/settings/applications/new). The callback is
`http://localhost:5000/auth/github/callback`, name and homepage you can fill out
as you desire.

And set the `GITHUB_CLIENT` and `GITHUB_SECRET` accordingly in the `.env` file.

If necessary you can set the other variables too, although only `MONGODB`,
`GITHUB_CLIENT`, `GITHUB_SECRET` are required and unless you have a reason to
then the `MONGODB` pre set in the `.env.example` file is correct.

Then source the environment file,

	source .env

Then to start the application run

	npm start
	
If you want to autorestart the server on file changes install `nodemon`

	npm install nodemon
	
Then it can be started with

	nodemon app.js

Contribute to this repo
-----------------------

This could potentially become the resource users will install their ReviewNinja
instance with. So any contributions, on customization are very welcome.

If you like any other provisioning provider better and can contribute your
script, feel free to open an issue and we are happy to create a repository for
it.
