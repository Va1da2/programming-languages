# Programming Languages: Section 9 - Multiple Inheritance

class Pt
    attr_accessor :x, :y
    def distToOrigin
        Math.sqrt(x * x + y * y)
    end
end

class ColorPt < Pt
    attr_accessor :color 
    def darken
        self.color = "dark " + self.color
    end
end

class Pt3D < Pt
    attr_accessor :z
    def distToOrigin
        Math.sqrt(x * x + y * y + z * z)
    end
end

# This does not exist in Ruby (or Java/C#, it does in C++)
#
# class ColorPt3D < ColorPt, Pt3D
#     ...
# end

# Two ways we could actually make 3D points

class ColorPt3D_1 < ColorPt
    attr_accessor :z
    def distToOrigin
        Math.sqrt(x * x + y * y + z * z)
    end
end

class ColorPt3D_2 < Pt3D
    attr_accessor :color
    def darken
        self.color = "dark " + self.color
    end
end