require 'rake/testtask'

Rake::TestTask.new do |t|
  t.pattern = "test/*_test.rb"
  t.test_files = ['./test/computer_test.rb']
end

task :default => :test

# require "rake"
# require "rake/testtask"
#
# Rake::TestTask.new do |t|
#   t.libs << "test"
#   t.test_files = FileList['test/*_test.rb']
#   t.verbose = true
# end
#
# task default: :test
