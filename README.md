# The Portfolio Project ![Build status](http://travis-ci.org/doolin/portfolio-project.png "Build status")

The project was started in early 2011 as a way to learn Rails
development from a greenfield perspective. Over the years it has
been updated as time and interest permit.

Currently using this code base as part of a mastery effort to build
effective habits, and for keeping an eye on Ruby and Rails evolution.
Hence, when the project is under active development, very small daily
updates. There is no new feature development planned at the moment.

To be more specific:

* This is a "toy" project for exploring Rails development
outside of commercial pressure.

* No new features currently planned (July 2017).

* The intent is to stay current on both Ruby and Rails
latest versions, and to keep the gems up to date. The
occasionally requires some little bit of effort, for
example, updating from RSpec 2.x to 3.x.

* Code changes reflecting best practice get incorporated as
best practice evolves. For example, once the Rubocop gem
was added, a large number of small commits dropped to bring
the code into more or less default Rubocop compliance.

Commits to the project (such as these README changes) are often
part of a daily programming regimen adopted to build habits
on a path to mastery. More reading on habits and mastery:

* George Leonard: "Mastery: The Keys to Success and Long-Term
  Fulfillment"
* BJ Fogg: http://www.bjfogg.com/ and http://tinyhabits.com/

## Development win!

As this is an on-again, off-again project, some notes follow as
reminders on how to keep the code running in development environment.

postgres configuration: apparently, a dump from 5 years ago successfully
restored. Had to change the user in `config/database.yml` to get the
application correct privileges to run.

### Restoring from S3

* Find the latest dump on S3 portfolio-project.

This is a hassle, I didn't document how I did this a few months ago,
I've now forgotten, and it's not restoring cleanly. Will have to take
some time and figure it out. Sadly, I can't really go much further on
the active admin branch without having working data.
