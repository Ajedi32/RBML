$LOAD_PATH << File.expand_path(File.dirname(__FILE__))
require 'rbml/dsl'
require 'rbml/fragment'
require 'rbml/text'
require 'rbml/html_fragment'
require 'rbml/document'

module RBML
  def self.parse(file)
    Template.parse(file)
  end
end
