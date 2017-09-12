# README

This README would normally document whatever steps are necessary to get the
application up and running.

AscensionTest application uses Rails 5.1.4 and ruby 2.4.1. Both are specified in the Gemfile 
(although Ruby can be removed from there). 

After cloning the application please run: 


> rails db:create

> rails db:migrate

> rails db:seed

The seed will generate three users with each of roles available: Community, Support, and Admin. Admin users are the only users that can modify other users' roles, although Support users can see all users in the system. Admin users cannot modify their own role, but they can modify other admin users' roles. For emails and passwords please see the seeds.rb file under db.

It features RSpec with Capybara features tests, Sqlite, and Bootstrap for a bit of pre-built CSS.

To run tests please run 

> rspec

A logged-in user can update their own password, and I also added first and last name in order to identify users more easily.
