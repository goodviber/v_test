require "bundler/gem_tasks"
require 'rspec/core'
require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

describe 'Run Vinterior Test'
task :run do

  project_root = File.dirname(File.absolute_path(__FILE__))
  Dir.glob(project_root + '/lib/*') { |file| require file }

  promo_rules = []
  promo_rules << PromoRule.discount_rule( 60, 10 )
  promo_rules << PromoRule.multi_discount_rule('001', 2, 8.50)
end
