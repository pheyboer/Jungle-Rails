# Jungle Rails 🛒

**Jungle** is a mini e-commerce application built with **Ruby on Rails**. It allows users to browse products, add items to their cart, and complete purchases securely. This project was built to deepen understanding of MVC architecture, database relationships, and full-stack development in a Rails environment.

## 🔧 Tech Stack

- **Backend:** Ruby on Rails  
- **Frontend:** Embedded Ruby (ERB), HTML5, CSS3  
- **Database:** PostgreSQL  
- **Authentication:** HTTP Basic Auth  
- **Payments:** Stripe (test mode)  
- **Testing:** RSpec, Capybara, Poltergeist
  
## 🚀 Features

- User authentication (admin and regular users)
- Secure checkout using Stripe test payments
- Admin dashboard for managing products and categories
- Product catalog with category filtering and inventory tracking
- Shopping cart with quantity adjustment and item removal
- Flash messages for user feedback
- Pagination and improved layout polish  

## 🧪 Testing

The application includes:

- Model tests (validations, associations)
- Feature tests (UI, form interactions)
- Admin-specific tests (CRUD actions)

  To run tests:

```bash
bundle exec rspec
```

## 🛠 Setup Instructions

1. **Clone the repo**

       git clone https://github.com/pheyboer/Jungle-Rails.git
       cd Jungle-Rails

2. **Install dependencies**

       bundle install

3. **Set up the database**

       rails db:reset

4. **Start the server**

       rails server

5. **Open in browser**

       http://localhost:3000

## 🔐 Admin Access

To access the admin dashboard:

- Navigate to `/admin/products`
- Use HTTP Basic Auth:
  - **Username:** `admin`
  - **Password:** `admin`
 
    
## 💳 Payments

Stripe is integrated in test mode. You can simulate a successful purchase using a universal test credit card. This works in Canada and internationally:

- Card number: `4242 4242 4242 4242`
- Expiry date: Any future date
- CVC: Any 3-digit number
- Postal Code: Any valid Canadian postal code (e.g. `M5V 3L9`)
  
## Notes

If you run into database authentication issues, edit `config/database.yml` and add your local DB username and password under `development` and `test`.


## 📚 Learning Outcomes

- Implemented RESTful routing and MVC structure
- Worked with ActiveRecord associations and validations
- Built and tested full-stack features in a Rails app
- Improved front-end UI using ERB and CSS
- Integrated third-party services like Stripe

## 🙋‍♂️ Author

**Peter Heyboer**  
[LinkedIn](https://www.linkedin.com/in/peterheyboer/)  
[GitHub](https://github.com/pheyboer)

## 📜 License

This project is licensed under the MIT License.

