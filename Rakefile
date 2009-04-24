# -*- ruby -*-

require 'rubygems'
require 'hoe'
require './lib/is_it_mobile.rb'

Hoe.new('is_it_mobile', IsItMobile::VERSION) do |p|
  p.rubyforge_name = 'contentfree'
  p.developer('Dave Myron', 'dave.myron@contentfree.com')
end

task :release_and_publish => [:release, :publish_docs]
