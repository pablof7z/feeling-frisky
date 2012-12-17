require "bundler"

Bundler.setup
Bundler.require(:default)
require 'rake'
require 'rspec/core/rake_task'

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require 'frisky-mongo/version'

RSpec::Core::RakeTask.new("spec") do |spec|
  spec.pattern = "spec/**/*_spec.rb"
end

task gem: :build
task :build do
  system "gem build frisky_mongo.gemspec"
end

task release: :build do
  version = FriskyMongo::VERSION
  system "git tag -a v#{version} -m 'Tagging #{version}'"
  system "git push --tags"
  system "gem push frisky_mongo-#{version}.gem"
  system "rm frisky_mongo-#{version}.gem"
end

task default: :spec