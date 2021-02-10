# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Screenshots

### Landing Page
Landing page, with an overview of all available products.
!["landing page"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_main.png?raw=true)

### Product Detail Page
Description page for a single item
!["product detail page"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_description.png?raw=true)

### Checkout Page
Displays content in my cart
!["checkout page"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_my_cart.png?raw=true)

### Order Summary Page
Displays order summary after payment success
!["order summary page"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_order_summary.png?raw=true)

### Login Page
!["login page"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_login.png?raw=true)

### SignUp Page
!["signup page"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_signup.png?raw=true)

### Admin Login Popup
Login popup for admin
!["admin login"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_password_for_admin.png?raw=true)

### Admin Dashboard
Overview of categories and products available.
!["admin dashboard"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_admin_dashboard.png?raw=true)

### Admin Categories
Manage the available categories.
!["admin categories"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_admin_categories.png?raw=true)

### Admin Products
Manage the available products.
!["admin products"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_admin_products.png?raw=true)

### Admin Sales
Manage the sales.
!["admin sales"](https://github.com/ngunner15/jungle-rails/blob/master/docs/jungle_admin_add_sale.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Tests

- Capybara
- RSpec
