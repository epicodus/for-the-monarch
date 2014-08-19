# :crown: For The Monarch!
This project is for the [Ruby Database Basics assessment](http://www.learnhowtoprogram.com/lessons/database-basics-assessment) at [Epicodus](http://www.epicodus.com/).

**For The Monarch!** is a campaign-management system built for a Monarch (that's you!).  The system allows the user to manage Knights and send them to fight in Provinces of your choosing.


## Installation

First ensure that you have the latest stable version of [Ruby](https://www.ruby-lang.org/en/) and [PostgreSQL](http://www.postgresql.org/) installed.

Download the zip of this repository or clone it via git by executing this command in your terminal:

```
git clone https://github.com/erjohnson/for-the-monarch.git
```

Navigate to the **For The Monarch!** project directory in your terminal:

```
cd $SOME_PATH/for-the-monarch
```

Once all the required project dependencies are installed and databases created you can start the app by running this command from the `for-the-monarch` directory:

```
ruby for_the_monarch.rb
```


### Dependencies

In your terminal you can execute these commands to get the appropriate dependency:

`gem install pg` to install PG, a library for interfacing with Postgres in Ruby.

`gem install rspec` to install RSpec, a testing tool for Ruby.

`gem install pry` to install Pry, a runtime developer console & alternative to IRB.

Note that rspec & pry are not required to run the app itself but are required to run the included tests.


### Setting up the Database

With Postgres installed open another terminal window. Start Postgres (visit the official [PostgreSQL](http://www.postgresql.org/) site if you have trouble installing or starting the database) and then access it by entering `psql` into your terminal.

If you've accessed Postgres, the terminal prompt should look a bit like:

```
some_name=#
```

You can enter `\l` to get a list of all your databases.

Next create the **For The Monarch!** database with:
(don't forget to include `;` at the end of your commands!)

```
CREATE DATABASE for_the_monarch;
```

Once the `for_the_monarch` database has been created, connect to it by entering:

```
\c for_the_monarch
```

When you're connected the terminal prompt should look a bit like:

```
for_the_monarch=#
```

Now create tables for each of the classes:

```
CREATE TABLE knights (id serial PRIMARY KEY, name varchar);

CREATE TABLE provinces (id serial PRIMARY KEY, name varchar, type varchar);

CREATE TABLE campaigns (id serial PRIMARY KEY, knight_id int, province_id int);
```

That should do it! For testing, the test database can be created by running:

```
CREATE DATABASE for_the_monarch_test;
```

And creating the above tables.


## Dependencies

* [Ruby](https://www.ruby-lang.org/en/): The Ruby Programming language.
* [PostgreSQL](http://www.postgresql.org/): Object-relational database.
* [PG](http://deveiate.org/code/pg/PGconn.html): Gem for interfacing with a PostgreSQL database.
* [RSpec](http://rspec.info/): Ruby testing library.
* [PRY](http://pryrepl.org/): Alternative REPL with useful features for debugging.


## Author

[Eric Johnson](https://github.com/erjohnson)


## License

[MIT](http://opensource.org/licenses/MIT)

*Copyright (c) 2014*

*Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:*

*The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.*

*THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.*
