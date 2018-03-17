# Read_It_Later

Welcome to Read_It_Later! This is a Sinatra web app that allows users to organize and save articles and web pages they would like to read but don't have time for right now.

Users set up an account, log in, and then can create Topic Folders and save Articles and their web addresses as they choose.  They can come back hours, days or years later and find the articles they'd like to read waiting for them.  Users can also see other users' saved articles and topics.  When done with an Article or Topic, feel free to delete.

If you enter something wrong the first time, you can always edit and update the correct web address, etc. later on.

## Installation & Usage

Clone this repository.

And then write in your terminal:

    $ bundle
    $ rake db:migrate

Set up the app with some example date by writing in your terminal:

    $ rake db:seed

    (You can always delete that seed info later)

This app has the gem 'shotgun' installed. In your terminal, run

    $ shotgun

And in your browser, go to http://localhost:9393/ to get started!
To stop running this app, type ^C  (Control + C).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kostanzhoglo/read_it_later. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Read_It_Later's project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/kostanzhoglo/healthy_foods/blob/master/CODE_OF_CONDUCT.md).
