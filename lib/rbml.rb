$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'rbml/dsl'
require 'rbml/fragment'
require 'rbml/text'
require 'rbml/html_fragment'

module RBML
  def self.parse(file)
    fragment = Fragment.new
    fragment.send(:instance_eval, File.read(file), file)
    fragment
  end
end
