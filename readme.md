# Rail Trail

[![Build Status](https://travis-ci.org/chrislaskey/rail-trail.svg?branch=master)](https://travis-ci.org/chrislaskey/rail-trail)

> Website for Community Feedback

## Technical Background

Rail Trail is built on [Ruby on Rails 5](http://rubyonrails.org/)

The application uses:

- [Devise](https://github.com/plataformatec/devise)
- [Omniauth](https://github.com/omniauth/omniauth)
- [Omniauth Facebook](https://github.com/mkdynamic/omniauth-facebook)
- [UIkit](https://getuikit.com/)

The test suite uses:

- RSpec
- Rubocop
- Factory Girl
- Shoulda Matchers

## Infrastructure

- Amazon EC2 for compute
- Facebook for user authentication
- Ansible for server configuration and code deployment

See the [Rail Trail Ansible repository](https://github.com/chrislaskey/rail-trail-ansible) for more details.
