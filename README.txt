= is_it_mobile
* http://rubyforge.org/projects/contentfree/

== DESCRIPTION:

Simply determines if a user agent is for a mobile device.

Comes ready with a module for Rails 2.0 to enable multiviews (respond_to with a custom mimetype) for mobile devices (see Synopsis).


== FEATURES/PROBLEMS:

* Fast & Lightweight (doesn't use anything like WURFL, which would be overkill for a quick check)


== SYNOPSIS:

The lightweight tests used in IsItMobile are almost completely based on the work of Andy Moore in an 
article at http://www.andymoore.info/php-to-detect-mobile-phones/. I added a couple more
user agents to the mix and obviously Rubified it.

It recognizes 99% of the mobile user agents from http://www.zytrax.com/tech/web/mobile_ids.html
It has nearly no false positives using the user agents from http://www.zytrax.com/tech/web/browser_ids.htm
The ones that don't quite pass are very rare (and some are even questionable appearing in their respective lists)

With Rails 2.0, you can use its multiview capabilities by simply adding this to your app:
- in config/initializers/mime_types.rb
Mime::Type.register_alias "text/html", :mobile

- in app/controllers/application.rb
require 'is_it_mobile'
class ApplicationController < ActionController::Base
  include IsItMobile::ForRails
end

Then, just create your views using suffices of mobile.erb instead of html.erb

You can also just use IsItMobile directly:
IsItMobile.mobile? 'NokiaN90-1/3.0545.5.1 Series60/2.8 Profile/MIDP-2.0 Configuration/CLDC-1.1'     # => true


== REQUIREMENTS:

None


== INSTALL:

sudo gem install is_it_mobile


== LICENSE:

Copyright (c) 2008

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
