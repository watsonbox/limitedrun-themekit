# limitedrun-themekit

[![Build Status](http://img.shields.io/travis/watsonbox/limitedrun-themekit.svg?style=flat)](https://travis-ci.org/watsonbox/limitedrun-themekit)

Toolkit for developing [Limited Run](http://www.limitedrun.com/) themes locally. Because Limited Run themes are made up of [liquid](http://liquidmarkup.org/) templates, they can't easily be worked on offline. This gem renders the templates locally using mock data to speed up development.

Extracted from my [telescope-pinna](https://github.com/watsonbox/telescope-pinna) theme for [Pinna Records](http://www.pinnarecords.com/).

At the moment this is a work in progress but should be fairly extensible. Please open a pull request if you add functionality.


## Installation

    $ gem install limitedrun-themekit


## Usage

Get hold of a responsive theme from Limited Run (export from the admin interface), and add a `store.json` to its root. See [store.json](https://github.com/watsonbox/limitedrun-themekit/blob/master/spec/assets/skeleton-theme/store.json) for an example as used in the specs.

Alternatively, clone [one of my themes](https://github.com/watsonbox/telescope-pinna) as a test.

    $ limitedrun-themekit

This command fires up Sinatra on http://localhost:4567/ with a preview of the site.


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request


# Todo

* Implement pagination
* Add more specs
* Static site generation