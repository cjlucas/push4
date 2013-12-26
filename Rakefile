$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'rake/testtask'

require 'faast/version'

task :default => [:test]

task :test do
  Rake::TestTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/test_*.rb']
    t.verbose = true
  end
end

task :build do
  system 'gem build faast.gemspec'
end

task :release => :build do
  system "gem push faast-#{Faast::VERSION}.gem"
end

task :clean do
  system 'rm -f *.gem'
end
