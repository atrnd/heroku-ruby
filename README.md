# heroku-ruby
- heroku-admin
	- 1. `heroku create`
	- 2. `git subtree push --prefix heroku-admin heroku master`
	- 3. `heroku run rake db:schema:load` Already has schema.
	- 4. `heroku ps:scale web=1`
	- 5. `heroku open`
	- 6. `heroku run bash` Server tunnel
	- 7. `heroku run rails console` Server run rails console
