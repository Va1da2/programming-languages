# Programming Languages: Section 8 - Overriding and Dynamic Dispatch

class Point
    attr_accessor :x, :y

    def initialize(x, y)
        @x = x
        @y = y
    end
    def distFromOrigin
        Math.sqrt(@x * @x + @y * @y)
    end
    def distFromOrigin2
        Math.sqrt(x * x + y * y)
    end

end

class ThreeDPoint < Point
    attr_accessor :z

    def initiliaze(x, y, z)
        super(x, y)
        @z = z
    end
    def distFromOrigin
        d = super
        Math.sqrt(d * d + @z * @z)
    end
    def distFromOrigin2
        d = super
        Math.sqrt(d * d + z * z)
    end
end

class PolarPoint < Point
    # By not calling super constructor, no x and y instance vars
    # In Java/C#/Smalltalk would just have unused x, y fields
    def initialize(r, theta)
        @r = r
        @theta = theta
    end
    def x
        @r * Math.cos(@theta)
    end
    def y
        @r * Math.sin(@theta)
    end
    def x= a
        b = y   # avoids multiple calls to y method
        @theta = Math.atan2(b, a)
        @r = Math.sqrt(a * a + b * b)
        self
    end
    def y= b
        a = x   # avoids multiple calls to x method
        @theta = Math.atan2(b, a)
        @r = Math.sqrt(a * a + b * b)
        self
    end
    def distFromOrigin
        @r
    end
    # distFromOrigin2 already works!!
end
