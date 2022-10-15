# Show Me Tweets
Welcome to Show Me Tweets! This is a front-end/UI portion of 2-part application deisigned with a separate *[API backend](https://github.com/B-gann21/dungeonball-be)*. This frontend application is responsible for retrieving tweet data from our backend application, and displaying those tweets to  visitors. Currently, the topics of tweets are limited to "healthcare", "nasa", and "opensource". The tweets retrieved are limited to those categorized as being in the English language. The backend application periodically (every 10 minutes) retrieves ten tweets for each category from the Twitter API and stores them in the database.

## Implementation

### Installation and Setup

1. Clone and implement the *[API backend](https://github.com/psitosam/nr_backend)*
2. In a separate repository, clone this repo
3. Run the following commands to install gem dependencies and create a database:
```bash
bundle install
rails db:{create:migrate}
```
4. This build makes use of the Figaro gem to hide sensitive environment variables. Currently, the only variable being obscured is the "base URL", which is the address of the backend application. In order to have full functionality, make sure to run:
```bash
bundle exec figaro install
```
after bundling. This will generate an application.yml file at config/application.yml, in which you will need to add the following snippet:
```ruby
BASE_URL: "https://hidden-woodland-25489.herokuapp.com"
```
In the future, additional functionality may be built out to configure a level of authorization between the FE and BE to ensure that only authorized users can make requests, but for the purposes of this code challenge I have left it open.
In order to run both applications simultaneously, open config/puma.rb and change line 12 from:
```ruby
port        ENV.fetch("PORT") { 3000 }
```
to:
```ruby
port        ENV.fetch("PORT") { 5000 }
```
5. Run:
```bash
rails s
```
on both the FE and BE applications to ensure both are running simultaneously.
6. You're up and running! We recommend you run
```bash
bundle exec rspec
```
and ensure all tests pass before deploying this software.

### Dependencies

This application was written for 
* rails 7.0.4
* ruby 3.1.0
because these were base requirements for deploying the application to production in a Heroku environment. It is important that you have installed and are using these versions in order to ensure functionality.

## Features

### Navigation
