# Concepts

**Dynos**
  - Dyno is a Linux container that web application run on it
  - 3 types of dyno's configuration:
    - Web dyno
    - Worker dyno
    - One-off dyno
  - We have 6 types of dyno: Free, Hobby, 2 of Standard and 2 of Performance
  - Mixing dyno types:
    - Free and Hobby can’t be mixed with other dyno types
    - An application using standard and performance dyno types can mix those dyno types
  - Only free dynos will sleep after 30 minutes of inactivity
  - Dyno information: [Heroku Dyno](https://devcenter.heroku.com/articles/free-dyno-hours)

**Load Balancing**
  - In Heroku, load balancing means scale dynos
  - We can scale web app except Free and Hobby
  - By default, all applications are limited to 100 dynos a process type can’t be scaled to more than 10 dynos for performance dynos
  - 2 ways to scale web app:
    - Manual scaling:
        > heroku ps:scale web=2 worker=1
    - Autoscaling: is configured from your app’s Resources tab on the Heroku Dashboard

**Database: Heroku postgresql**
  - We have to choose the right Heroku Postgres plan in 3 types:
    - Hobby tier (Not support Rollback, No fork/follow DB, No in-memory cache)
    - Standard tier
    - Premium tier
  - Backup:
    - Each Heroku postgres plan has number of Backup Retained
    - Scheduling backups:
        > heroku pg:backups:schedule DATABASE_URL --at '[time]' --app [app_name]

   - Scheduled backups retention limits: For all plans, a daily backup is retained for the last at least 7 days depend on Heroku plan
    - Downloading your backups:
        > heroku pg:backups:download
    - Backup infomation: [Heroku back-up](https://devcenter.heroku.com/articles/heroku-postgres-backups)

  - Database information: [Heroku Postgres](https://devcenter.heroku.com/articles/heroku-postgresql)

**Process types as templates**
  - A Procfile contains a number of process type declarations, each on a new line. Each process type is a declaration of a command that is executed when a dyno of that process type is started
  - Declaring process types:
    > `<process type>: <command>`
        - `<process type>` – an alphanumeric string, is a name for your command, such as web, worker, urgentworker, clock, etc
        - `<command>` – a command line to launch the process, such as rake jobs:work

  - More information: [Procfile](https://devcenter.heroku.com/articles/procfile#process-types-as-templates)

**Heroku redis**

  - Cd vào folder
  - Run heroku config:
    > set REDIS_PROVIDER=REDISCLOUD_URL
    > Note: check env variable https://devcenter.heroku.com/articles/config-vars
  - Create new file config/redis.rb then add new lines:
    > uri = ENV["REDISTOGO_URL"] || "redis://localhost:6379/"
    > REDIS = Redis.new(:url => uri)
  - File Procfile, add new line:
    > worker: bundle exec sidekiq -c 5 -v

  > Note: Vì môi trường production nên sử dụng password apps cho gmail

**Turn on worker**
- Install plugin Heroku Redis :: Redis
  > Check heroku config | grep REDIS


