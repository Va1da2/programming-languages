# Programming Languages: Section 8 - Class Definitions are Dynamic

require_relative "./rational_class_example"

# above line defines the MyRational class by now we can change it

class MyRational
    def double
        self + self
    end
end

class Fixnum
    def double
        self + self
    end
end

def m
    42
end

class Object
    def m
        42
    end
end