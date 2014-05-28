require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'flay'
require 'flay_task'
require 'flog'
require 'reek/rake/task'
require 'rubocop/rake_task'

ruby_source = FileList['lib/**/*.rb', 'bin/*', 'spec/**/*.rb']

RSpec::Core::RakeTask.new(:spec)

task default: :spec
task quality: [:rubocop, :flay, :flog, :reek]

Reek::Rake::Task.new do |t|
  t.fail_on_error = false
  t.verbose = false
  t.ruby_opts = ['-rubygems']
  t.reek_opts = '--quiet'
  t.source_files = ruby_source
end

FlayTask.new do |t|
  t.dirs = ruby_source.map do |each|
    each[/[^\/]+/]
  end.uniq
  t.threshold = 0
  t.verbose = true
end

desc 'Analyze for code complexity'
task :flog do
  flog = Flog.new(continue: true)
  flog.flog(*ruby_source)
  threshold = 28

  bad_methods = flog.totals.select do |name, score|
    !(/##{flog.no_method}$/ =~ name) && score > threshold
  end
  bad_methods.sort { |a, b| a[1] <=> b[1] }.reverse.each do |name, score|
    printf "%8.1f: %s\n", score, name
  end
  unless bad_methods.empty?
    $stderr.puts "#{bad_methods.size} methods have a complexity > #{threshold}"
  end
end

Rubocop::RakeTask.new do |task|
  task.patterns = %w(lib/**/*.rb
                     spec/**/*.rb
                     Rakefile
                     Gemfile)
end
