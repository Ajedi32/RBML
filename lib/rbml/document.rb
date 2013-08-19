module RBML
  class Template
    def self.parse(file)
      new(file)
    end
    def self.build_proc(file)
      if file
        eval("proc do |data|\n#{File.read(file)}\nend", binding, file, -1)
      else
        eval("proc do |data|\n#{File.read(file)}\nend")
      end
    end
    def initialize(file)
      @fragment_builder = Template.build_proc(file)
    end
    def compile(data={})
      fragment = Fragment.new
      fragment.send(:instance_exec, data, &@fragment_builder)
      fragment
    end
  end
end
