# Hemmingway

Stop blocking your marketing team. Let them make their static pages. Hemmingway is a drop-in static CMS inspired by [high_voltage](https://github.com/thoughtbot/high_voltage) for managing your `/about`, `/faq` and other simple pages.

Hemmingway uses [CKEditor](https://github.com/ckeditor/ckeditor-dev/) so anyone can edit the HTML for your page. It doesn't allow pasting in weird styles from Microsoft Word. You specify the layout to use, and can also provide an HTML template for new pages, to give other departments a good starting point.

We also use the awesome in-place editing capabilities, so any admin can go to `/about` and fix a typo immediately, without going into a separate edit screen.

### Installation

1. Add Hemmingway to your Gemfile
    
    `gem 'hemmingway'`

2. Install and run the migration

    ```bash
    rails g hemmingway:install:migrations
    rake db:migrate
    ```

3. Add the CSS and JS to your application. These tools are namespaced, so they won't interfere with your app's styles or scripts. Hemmingway requires jQuery.

    ```
    # app/assets/stylesheets/application.css.scss
    @import 'hemmingway/hemmingway'
    
    # app/assets/stylesheets/application.css
    *= require hemmingway/application
    
    # app/assets/javascripts/application.js
    //= require hemmingway/application
    ```

4. Set up the configuration as outlined below. We try to set sane defaults, but you will at least want to set the layout to use and how to check whether a user is authorized to edit pages.

Never make a static page again :smiling_imp:

### Configuration

Hemmingway has a number of configuration options. Create an initializer and set up the various options.

```ruby
# config/initializers/hemmingway.rb

Hemmingway.configure do |config|
  
  # the layout used for Hemmingway's resource scaffold 
  # and for displaying pages
  # default is hemmingway/application
  
  config.layout = 'my_layout.html.haml' 


  # a Proc used to check whether a user is authorized
  #  to edit pages
  config.admin_check = Proc.new { current_user.is_admin? } 
  # defaults to allow anyone to edit

  # the base url for Hemmingway's pages
  config.routes = :content 
  # myapp.com/content/about - defaults to /pages/about

  # use the special route :root to display pages at root-level
  # users will not be allowed to save a page that overwrites
  # an already-defined route
  config.routes = :root # myapp.com/about

  # use Rails' built-in caching for pages?
  # Hemmingway will try and auto-warm the 
  # cache so static page requests never hit the database
  config.cache = true

  # use a template as the default when creating new pages
  # use any templating language here, but it will be 
  # rendered to HTML in the page code
  config.template = 'home/page_template'
  # use app/views/home/page_template.html.slim

  # set default css classes to use for tags in Hemmingway pages
  config.styles = {
    h1: 'sm-tiny lg-huge',
    p:  'big-font'
  }

end
```

### Reporting issues

Please use [Github Issues](https://github.com/agius/hemmingway/issues) to report any problems, and we'll try and deal with them. If you fixed something, please open a pull request and we will give you internet kudos!

### Development

Please see [CONTRIBUTING.md](https://github.com/agius/hemmingway/blob/master/CONTRIBUTING.md) for more details.

### Credits

Hemmingway was developed for [Hired, Inc](https://hired.com). We encourage forks, pull requests, and issues. Get in touch with the Hired engineering team at opensource@hired.com 

### License

This project uses the [MIT-LICENSE](https://github.com/agius/hemmingway/blob/master/MIT-LICENSE).
