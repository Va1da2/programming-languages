# Programming Langauges: Section 8 - Subclassing 

class Point
    attr_accessor :x, :y    # defines methods x, y, x= and y=

    def initialize(x, y)
        @x = x
        @y = y
    end
    def distFromOrigin
        Math.sqrt(@x * @x + @y * @y)    # uses instance variables
    end
    def distFromOrigin2
        Math.sqrt(x * x + y * y)
    end

end

class ColorPoint < Point
    attr_accessor :color

    def initialize(x, y, c="clear")
        super(x, y) # keyword super calls same method in superclass
        @color = c
    end

end