# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{is_it_mobile}
  s.version = "1.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dave Myron"]
  s.date = %q{2009-07-06}
  s.description = %q{TODO}
  s.email = %q{dave.myron@contentfree.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README"
  ]
  s.files = [
    ".gitignore",
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
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{TODO}
  s.test_files = [
    "spec/is_it_mobile_spec.rb",
     "spec/spec_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
