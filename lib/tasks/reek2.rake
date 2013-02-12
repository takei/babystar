require 'reek/cli/application'
require 'fileutils'
require 'erb'
require 'yaml'
require File.join(File.dirname(File.dirname(File.expand_path(__FILE__))), 'tasks/reek_parser.rb')

desc 'Execute reek comannd and then generate html reports'
task :reek2 do
  OPTIONS=['--yaml', '--quiet', 'app']
  reek_checker = MyReekApplication.new(OPTIONS)
  reek_checker.execute

  OUTPUT_DIR = 'metrics'
  FileUtils.mkdir_p OUTPUT_DIR

  OUTPUT_FILE = OUTPUT_DIR + '/reek.yaml'
  open(OUTPUT_FILE, 'w') do |f|
    reek_checker.results.each do |item|
      f.write item
    end
  end

  ReekViewer.new(OUTPUT_FILE).publish_html
end

# Extend Reek::Cli::Application for the class can keep Reek results
class MyReekApplication < Reek::Cli::Application

  attr_reader :results

  def initialize(argv)
    super(argv)
    @results = Array.new
  end

  def output(text)
    @results.push(text)
  end
end

# Created by seeing https://github.com/Shinya131/reek_viewer
class ReekViewer

  def initialize(input_file_path)
    @input_file_path = input_file_path
    reeks = ReeksList.new(@input_file_path)
    @reeks_list = reeks.divide_reeks
    @keys = reeks.context_class_list
    @sum_of_waning_num = reeks.total_warning_num
  end

  def publish_html
    erb_str = open(Dir::pwd + '/lib/tasks/view_template.erb').read
    html = ERB.new(erb_str).result(binding)
    open(@input_file_path + ".html", "w"){|f| f.write html }
  end
end

