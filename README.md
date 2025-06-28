# Jungle 🛒

A mini e-commerce application built with Ruby on Rails 6.1. Developed during my web development bootcamp to explore Rails fundamentals like MVC architecture, Active Record, admin workflows, and Stripe payment integration.

## Features

- Product catalog with category filtering  
- Shopping cart and order placement using Stripe (test mode)  
- Admin dashboard for inventory and category management  
- Authentication using HTTP Basic Auth  
- Seeded database for easy setup and testing  

## Setup Instructions

1. Clone the repo and navigate to the project folder  
2. Run `bundle install`  
3. Copy example config files:  
   - `cp config/database.example.yml config/database.yml`  
   - `cp config/secrets.example.yml config/secrets.yml`  
   - `cp .env.example .env`  
4. Set up the database:  
   `bin/rails db:reset`  
5. Add your Stripe test keys to the `.env` file  
6. Start the server:  
   `bin/rails s -b 0.0.0.0`  
7. Visit `http://localhost:3000` in your browser

## Stripe Test Card

To test purchases, use:  
`4111 1111 1111 1111`  
with any valid future expiry date and 3-digit CVC.

More test cards: https://stripe.com/docs/testing#cards

## Tech Stack

- Ruby on Rails 6.1  
- PostgreSQL  
- Bootstrap 5  
- Stripe API  
- RSpec  
- HTML, CSS, ERB

## Notes

If you run into database authentication issues, edit `config/database.yml` and add your local DB username and password under `development` and `test`.

