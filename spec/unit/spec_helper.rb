# Taken from Objects in Rails
# Conditionally create empty or "stub" modules only if 
#   a) they are not already defined; 
#   b) they are not auto-loadable.
def stub_module(full_name)
  full_name.to_s.split(/::/).inject(Object) do |context, name|
    begin
      context.const_get(name)
    rescue NameError
      context.const_set(name, Module.new)
    end
  end
end

def stub_class(full_name)
  full_name.to_s.split(/::/).inject(Object) do |context, name|
    begin
      context.const_get(name)
    rescue NameError
      context.const_set(name, Class.new)
    end
  end
end

stub_module("ActiveRecord")
stub_class("ActiveRecord::Base")

class Job < ActiveRecord::Base; end
