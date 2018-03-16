# Programming Languages: Section 8 - Object State

class A
    def initialize(f=0)
        @foo = f # initialize instance variable
    end
    def m1
        @foo = 0 # assign to instance variable
    end
    def m2 x
        @foo += x
        @bar = 0        
    end
    def foo
        @foo
    end
end

class C
    # we add in  class-variable, class-constant and class-method
    MY_AGE = 33

    def self.reset_bar
        @@bar = 0
    end
    def initialize(f=0)
        @foo = f
    end
    def m2 x
        @foo += x
        @@bar += 1
    end
    def foo
        @foo
    end
    def bar
        @@bar
    end
end