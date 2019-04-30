# student_data_bank

This is a Content Management System for a nursery to keep the daily information about their students. This daily information will be referred to as activities.

The app provides a database and web interface for users to:

* Sign up, log in or log out securely as a nursery staff or parent. 
* Nursery staff can create, read, update, and delete (CRUD) an activity.
* Parents can read only the personal profile page of their children.
* User inputs are validated for account creation.


Student Data Bank was built with [Sinatra](http://sinatrarb.com/), extended with [Rake](https://github.com/ruby/rake) for working with an SQL database using [ActiveRecord ORM](https://github.com/rails/rails/tree/master/activerecord).
## Getting Started


### Prerequisites
Gems you need to install the software:

* bundler

```
$ sudo gem install bundler
```

After checking out the repository, run the following code and automatically a file will be created or updated in your directory: Gemfile.lock with all the gems installed.

```
$ bundle install
```

### Installation

To install this app onto your local machine:

* Clone this repository with HTTPS
* Open your terminal and change to the local directory where you want to clone your repository and run:

```
$ git clone + the link copied before.
```

### Usage
You can start one of Rack's supported servers using the [shotgun](https://github.com/rtomayko/shotgun) command. 

```
$ shotgun
```
### Model Classes
Student Data Bank database includes three model classes: User, Activity and Student.

1. User: stores user attributes, including:
* Username
* Email
* Password (Secured with Bcrypt hashing algorithm)
* Nursery_staff, a boolean value to indicate if a user is a nursery staff

2. Activity: stores activity attributes, including:
* Date
* Student_id, to associate Activity to Student
* Breakfast
* Morning Snacks
* Lunch
* Afternoon Snacks
* Sleep
* Nappies
* Comments

3. Student: stores student attributes, including:
* Name
* User_id, to associate Student to User
* Key person
* Room

### Model Associations
User (parent) has many students.
Student has many activities and belongs to a User (parent).
Activity belongs to a Student.


### Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/DianaBaRo/student_data_bank. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](https://www.contributor-covenant.org/) code of conduct.

## Author

* **Diana Badas** - *Initial work* - [DianaBaRo](https://github.com/DianaBaRo)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).