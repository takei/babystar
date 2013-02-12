require 'reek/cli/application'
require 'fileutils'
require 'erb'
require 'yaml'

desc 'Execute reek command and then generate html reports'
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

# I dont know how to require other ruby files into this rake file
# so I copied all.
# https://github.com/Shinya131/reek_viewer
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

class ReekYamlFile
  def initialize(path)
    @path = path
    unless File.exist?(@path) then raise "no such file or directory" end
    file_load
    unless file_yaml? then raise "input file is not YAML format" end
    unless file_reek_output? then raise "input file is not reek output" end
  end

  def to_reeks; @content; end

private
  def file_load; File::open(@path) {|f| @content = YAML.load(f) }; end

  def file_yaml?; @content != false; end

  def file_reek_output?; @content.first.class == Reek::SmellWarning; end
end

class ReeksList
  attr_reader :divide_reeks
  def initialize(input_file_path)
    @raw_reeks = ReekYamlFile.new(input_file_path).to_reeks
    @divide_reeks = []
    divide_by_context_class
    sort_by_warning_num
  end
  def each
    @divide_reeks.each {| reeks | yield(reeks)}
  end
  def each_with_index
    @divide_reeks.each_with_index {| reeks, i | yield(reeks, i)}
  end
  def context_class_list
    @divide_reeks.map{|reeks| reeks.first.context_class}
  end
  def total_warning_num
    @divide_reeks.flatten.size
  end
private
  def divide_by_context_class
    context_class_list = @raw_reeks.map{|reek| reek.context_class }.uniq
    context_class_list.each do |context_class|
      @divide_reeks << @raw_reeks.select{|reek| reek.context_class == context_class }
    end
  end
  def sort_by_warning_num
    @divide_reeks.sort!{|a, b| b.size <=> a.size}
  end
end

module Reek
  class SmellWarning
    attr_accessor :smell, :location
    def context_class; location["context"].split("#").first; end
  end
end
