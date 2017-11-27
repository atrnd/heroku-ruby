# heroku-ruby
- heroku-admin
	-  `heroku create`
	-  `git subtree push --prefix heroku-admin heroku master`
	-  `heroku run rake db:migrate` or `heroku run rake db:schema:load` If already has schema.
	-  `heroku ps:scale web=1`
	-  `heroku open`
	-  `heroku run bash` Server tunnel
	-  `heroku run rails console` Server run rails console
	-  `https://tranquil-fjord-55419.herokuapp.com/shops`
- heroku-api
	-  `heroku create`
	-  `heroku git:remote -a APP_NAME` add remote for new app
 	-  `git subtree push --prefix heroku-api heroku master`
	-  Sharing DB https://devcenter.heroku.com/articles/heroku-postgresql#sharing-heroku-postgres-between-applications
	- `heroku ps:scale web=1`
	-  `https://guarded-anchorage-62093.herokuapp.com/api/v1/shops`


# Concepts
** Dynos **
	- `Dyno is a Linux container that web application run on it`
	- `3 types of dyno's configuration:`
		- 'Web dyno'
		- 'Worker dyno'
		- 'One-off dyno'
	- `We have 6 types of dyno: Free, Hobby, 2 of Standard and 2 of Performance`
	- `Mixing dyno types:`
		+ `Free and Hobby can’t be mixed with other dyno types`
		+ `An application using standard and performance dyno types can mix those dyno types`
	- `Only free dynos will sleep after 30 minutes of inactivity`
	- `Dyno information: [Heroku Dyno](https://devcenter.heroku.com/articles/free-dyno-hours)`

** Load Balancing **
	- `In Heroku, load balancing means scale dynos`
	- `We can scale web app except Free and Hobby`
	- `By default, all applications are limited to 100 dynos a process type can’t be scaled to more than 10 dynos for performance dynos`
	- `2 ways to scale web app:`
		- `Manual scaling: `
			> heroku ps:scale web=2 worker=1
		- `Autoscaling: is configured from your app’s Resources tab on the Heroku Dashboard`

** Database: Heroku postgresql **
	- `We have to choose the right Heroku Postgres plan in 3 types:`
		- `Hobby tier (Not support Rollback, No fork/follow DB, No in-memory cache)`
		- `Standard tier`
		- `Premium tier`
	- `Backup:`
		- `Each Heroku postgres plan has number of Backup Retained`
		- `Scheduling backups: `
			> heroku pg:backups:schedule DATABASE_URL --at '[time]' --app [app_name]
		- `Scheduled backups retention limits: For all plans, a daily backup is retained for the last at least 7 days depend on Heroku plan`
		- `Downloading your backups: `
			> heroku pg:backups:download
		- `Backup infomation: [Heroku back-up](https://devcenter.heroku.com/articles/heroku-postgres-backups)`
	- `Database information: [Heroku Postgres](https://devcenter.heroku.com/articles/heroku-postgresql)`
