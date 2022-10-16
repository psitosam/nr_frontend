# Show Me Tweets
Welcome to Show Me Tweets! This is a front-end/UI portion of 2-part application deisigned with a separate *[API backend](https://github.com/psitosam/nr_backend)*. This frontend application is responsible for retrieving tweet data from our backend application, and displaying those tweets to  visitors. Currently, the topics of tweets are limited to "healthcare", "nasa", and "opensource". The tweets retrieved are limited to those categorized as being in the English language. The backend application periodically (every 10 minutes) retrieves ten tweets for each category from the Twitter API and stores them in the database.

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
in order to hit the live application. However, if you wish to only deploy on your local servers, the repo is set up to do so!
Instead of using the live URL listed above, simply add this snippet to your ```config/application.yml``` file:
```ruby
BASE_URL: "http://127.0.0.1"
```
Right now the frontend is set up to run on ```localhost:3000``` and the backend is set up to run on ```localhost:5000```.

In order to make changes to this, please open ```config/puma.rb``` and change:

```ruby
port        ENV.fetch("PORT") { 3000 }
```
to:
```ruby
port        ENV.fetch("PORT") { your_port_goes_here }
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

### Welcome Page
<img width="1300" alt="home_page" src="https://user-images.githubusercontent.com/95240894/196000394-383897ff-91ac-4be2-a569-78f01751c2e0.png">

The landing page presents the title of the app and asks the visitor what tweets they would like to view. Each topic has a link to a separate page that will render ten tweets arranged according to topic. Additionally, there is a Return Home link on each page to return to the Welcome page.

### Healthcare Page
<img width="1328" alt="healthcare_search" src="https://user-images.githubusercontent.com/95240894/196000435-f69a1670-4fe0-416d-9637-01355e5a0d7f.png">

This page renders ten tweets that are the results of a query with "healthcare" params sent to the backend application, as well as the Return Home link.

### NASA page
<img width="1339" alt="nasa_search" src="https://user-images.githubusercontent.com/95240894/196000452-ab2e1f72-141e-417a-bc50-553ba1166c6f.png">

Similar to the Healthcare page, but with "nasa" params.

### Open Source page
<img width="1337" alt="opensource_search" src="https://user-images.githubusercontent.com/95240894/196000474-a7205a28-e561-4c7b-80f1-1e471c9a31db.png">

As above, with "opensource" params.

## Contact
### Contributors

* Alex Psitos     | [Github](https://github.com/psitosam) | [LinkedIn](https://www.linkedin.com/in/alex-psitos-5429a1232/) | [Portfolio](https://www.alexpsitos.dev)
