# Programming Languages: Section 9 - Binary Methods With OOP: Double Dispatch

class Exp
    # could put default implementation or helper methods here
end

class Value < Exp
    # Overkill here but usefull if you have multiple kinds of
    # /values/ in your language that can share methods that
    # do not make sense for non value expressions
end

class Int < Value
    attr_reader: :i
    def initialize i
        @i = i
    end

    def eval # no arguments because no environment
        self
    end

    def toString
        @i.to_s
    end

    def hasZero
        i == 0
    end

    def noNegConstant
        if i < 0
            Negate.new(Int.new(-i))
        else
            self
        end
    end

    # double-dispatch for adding values
    def add_values v    # first dispatch
        v.addInt self
    end

    def addInt v    # second dispatch: other is Int
        Int.new(v.i + i)
    end

    def addString v     # third dispatch: other is MyString
        MyString.new(v.s + i.to_s)
    end

    def addRational v   # fourth dispatch: other is MyRational
        MyRational.new(v.i + v.j * i, v.j)
    end
end


# new value classes MyString and MyRational
class MyString < Value
    attr_reader :s
    def initialize s
        @s = s
    end

    def eval
        self
    end

    def toString
        s
    end

    def hasZero
        false
    end

    def noNegConstants
        self
    end

    # double-dispatch for adding values
    def add_values v # first dispatch
        v.addString self
    end

    def addInt v    # second dispatch: other is Int
        MyString.new(v.i.to_s + s)
    end

    def addString v     # third dispatch: other is MyString
        MyString.new(v.s + s)
    end

    def addRational v   # fourth dispatch: other is MyRational
        MyString.new(v.toString + s)
    end
end

class MyRational < Value
    attr_reader :i, :j
    def initialize(i, j)
        @i = i
        @j = j
    end

    def eval
        self
    end

    def toString
        i.to_s + "/" + j.to_s
    end

    def hasZero
        i == 0
    end

    def NoNegConstants
        if i < 0 && j < 0
            MyRational.new(-i, -j)
        elsif j < 0
            Negate.new(MyRational.new(i, -j))
        elsif i < 0
            Negate.new(MyRational.new(-i, j))
        else
            self
        end
    end

    def add_values v    # first dispatch
        v.addRational self
    end

    def addInt v    # second dispatch
        v.addRational self # reuse computation (commutative)
    end

    def addString v     # third dispatch
        MyString.new(v.s + i.to_s + "/" + j.to_s)
    end

    def addRational v   # fourth dispatch
        a, b, c, d = i, j, v.i, v.j
        MyRational.new(a*d + c*b, b*d)
    end
end

class Negate < Exp
    attr_reader :e
    def initialize e
        @e = e
    end

    def eval
        Int.new(-e.eval.i) # error if `e.eval` has no `i` method
    end

    def toString
        "-(" + e.toString + ")"
    end

    def hasZero
        e.hasZero
    end

    def noNegConstants
        Negate.new(e.noNegConstants)
    end
end

class Add < Exp
    attr_reader :e1, :e2
    def initialize(e1, e2)
        @e1 = e1
        @e2 = e2
    end

    def eval
        e1.eval.add_values e2.eval
    end

    def toString
        "(" + e1.toString + " + " + e2.toString + ")"
    end

    def hasZero
        e1.hasZero || e2.hasZero
    end

    def noNegConstants
        Add.new(e1.noNegConstants, e2.noNegConstants)
    end
end

class Mult < Exp
    attr_reader :e1, :e2
    def initialize(e1, e2)
        @e1 = e1
        @e2 = e2
    end

    def eval
        Int.new(e1.eval.i * e2.eval.i)
    end

    def toString
        "(" + e1.toString + " * " + e2.toString + ")"
    end

    def hasZero
        e1.hasZero || e2.hasZero
    end

    def noNegConstants
        Mult.new(e1.noNegConstants, e2.noNegConstants)
    end
end