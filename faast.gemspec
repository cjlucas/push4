$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'faast/version'

Gem::Specification.new do |s|
  s.name        = 'faast'
  s.version     = Faast::VERSION
  s.summary     = 'A ruby library for the Faast push notification service'
  #s.description = <<-EOF
  #EOF
  s.authors     = ['Chris Lucas']
  s.email       = ['chris@chrisjlucas.com']
  s.homepage    = 'https://github.com/cjlucas/ruby-faast'
  s.license     = 'MIT'
  s.files       = `git ls-files | egrep '^[^\.]'`.split(/\r?\n/)
  s.test_files  = s.files.select { |f| f.match(/^test\/.*\.rb$/) }
  s.platform    = Gem::Platform::RUBY

  s.add_development_dependency('rake')
end
