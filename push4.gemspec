$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'push4/version'

Gem::Specification.new do |s|
  s.name        = 'push4'
  s.version     = Push4::VERSION
  s.summary     = 'A ruby library for the Push 4.0 API'
  #s.description = <<-EOF
  #EOF
  s.authors     = ['Chris Lucas']
  s.email       = ['chris@chrisjlucas.com']
  s.homepage    = 'https://github.com/cjlucas/ruby-push4'
  s.license     = 'MIT'
  s.files       = `git ls-files | egrep '^[^\.]'`.split(/\r?\n/)
  s.test_files  = s.files.select { |f| f.match(/^test\/.*\.rb$/) }
  s.platform    = Gem::Platform::RUBY

  s.add_development_dependency('rake')
end
