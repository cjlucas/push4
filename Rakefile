$LOAD_PATH.unshift(File.expand_path('../lib', __FILE__))

require 'rake/testtask'

require 'push4/version'

#task :default => [:build]

task :test do
  Rake::TestTask.new do |t|
    t.libs << 'test'
    t.test_files = FileList['test/test_*.rb']
    t.verbose = false
  end
end

task :build do
  system 'gem build push4.gemspec'
end

task :release => :build do
  system "gem push push4-#{Push4::VERSION}.gem"
end

task :clean do
  system 'rm -f *.gem'
end
