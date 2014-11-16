## Shopping Lab

For this lab, we'd like you to create a small application that mimics a very minialistic shopping site. The application should allow users to sign up and login and then see a list of products and create orders which are different combinations of products

## Getting started

1. Create a User, Product, Order model

2. A User should have a:

	- username (this should always be unique)
	- password (this should be at least 5 characters)
	- password_digest (this is for `has_secure_password`)
	- is_admin (a boolean which by default is false)
	
3. A Product should have a:
	- name (this should always be present)
	- category
	- price

3. An Order should have a:
	- name (this should always be present)	
2. Start setting up your associations (a user can make many orders, many orders have many different products and many different products can belong to many different orders)
3. Use has many through for your many to many association.
4. Test your models, associations and validations in rails console before continuing.

## Views and Controllers

1. Start by building a simple log in system using `has_secure_password` and sessions.
2. Your login form should have a password confirmation field 
3. When a user logs in, if they are not an admin, they should see a list of products and have the option to create a new order and see their existing orders
4. If the user is an admin, they should be able to perform full CRUD on the products.
5. When a user goes to create a new order, they should see a list of all of the products and be able to add how ever many products they like to each other (use checkboxes for this - review the cookbook app to see how this was done)

BONUS

1. Ensure that users can only see __their__ orders unless they are an admin.
2. Allow admin's to view a list of all of the users 
3. Allow users to change their personal information (username and password)
4. Show the total price of the order when a users sees their orders

For each product - show how many times it was added to an order (this product has been purchased over 30 times etc)

