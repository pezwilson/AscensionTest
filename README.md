# README

The AscensionTest Rails application uses Rails 5.1.4 and ruby 2.4.1. Both are specified in the Gemfile 
(although Ruby can be removed from there). 

After cloning the application please run: 


<code>rails db:create</code>

<code>rails db:migrate</code>

<code>rails db:seed</code>

The seed will generate three users with each of roles available: Community, Support, and Admin. Admin users are the only users that can modify other users' roles, although Support users can see all users in the system. Admin users cannot modify their own role, but they can modify other admin users' roles. For emails and passwords please see the seeds.rb file under db.

It features RSpec with Capybara features tests, Sqlite, and Bootstrap for a bit of pre-built CSS.

To run tests please run 

<code>rspec</code>

A logged-in user can update their own password, and I also added first and last name in order to identify users more easily.
