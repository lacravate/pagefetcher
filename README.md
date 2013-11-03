# PageFetcher

PageFetcher is a little Rails 3 app', to get me acquainted with Facebook API.

The UX is utterly undignified, i sincerely apologize for that.

You could think it left me time to spoil the code beauty and elegance. Well, no.

This is really a little exercise that i tried to take as seriously as possible,
in a certain given lapse of time.

Database is SQLite3. So if you have the libs on your machine, the app' shoudld
be self-sufficient.

## Installation

Ruby 2 is required.

Install it with git:

    git clone https://github.com/lacravate/pagefetcher

## Use

```
cd pagefetcher
bundle
vim config/facebook.yml # give your app_secret et app_id there
                        # the app will get you a token if you don't have any
bundle exec rake db:setup
bundle exec rake db:test::prepare # if you want to run the tests

# and...
rails s # could do the trick...
```

## Thanks

Eager and sincere thanks to all the Ruby guys and chicks for making all this so
easy to devise.

## Copyright

I was tempted by the WTFPL, but i have to take time to read it.
So far see LICENSE.
