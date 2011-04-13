require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "is_it_mobile"
    s.summary = %Q{Simply determines if a user agent is for a mobile device.}
    s.email = "dave.myron@contentfree.com"
    s.homepage = "http://github.com/contentfree/is_it_mobile"
    s.description = "Simply determines if a user agent is for a mobile device."
    s.authors = ["Dave Myron"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = 'is_it_mobile'
  rdoc.options << '--line-numbers' << '--inline-source'
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

begin
  require 'spec/rake/spectask'
  Spec::Rake::SpecTask.new(:spec) do |t|
    t.libs << 'lib' << 'spec'
    t.spec_files = FileList['spec/**/*_spec.rb']
  end

  Spec::Rake::SpecTask.new(:rcov) do |t|
    t.libs << 'lib' << 'spec'
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.rcov = true
  end
rescue LoadError
  puts "RSpec 1.x is not available."
end

begin
  require 'cucumber/rake/task'
  Cucumber::Rake::Task.new(:features)
rescue LoadError
  puts "Cucumber is not available. In order to run features, you must: sudo gem install cucumber"
end

