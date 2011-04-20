# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{is_it_mobile}
  s.version = "1.4.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Myron"]
  s.date = %q{2011-04-20}
  s.description = %q{Simply determines if a user agent is for a mobile device.}
  s.email = %q{dave.myron@contentfree.com}
  s.extra_rdoc_files = [
    "LICENSE",
    "README"
  ]
  s.files = [
    "LICENSE",
    "README",
    "Rakefile",
    "VERSION.yml",
    "features/is_it_mobile.feature",
    "features/steps/is_it_mobile_steps.rb",
    "features/support/env.rb",
    "is_it_mobile.gemspec",
    "lib/is_it_mobile.rb",
    "lib/rails/init.rb",
    "spec/is_it_mobile_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{http://github.com/contentfree/is_it_mobile}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.7.2}
  s.summary = %q{Simply determines if a user agent is for a mobile device.}
  s.test_files = [
    "spec/is_it_mobile_spec.rb",
    "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end

