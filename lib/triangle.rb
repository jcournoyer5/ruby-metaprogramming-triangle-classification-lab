class Triangle
  
attr_reader :side_a, :side_b, :side_c

  def initialize(side_a, side_b, side_c)
    @side_a = side_a
    @side_b = side_b
    @side_c = side_c
  end
  
  
  def kind
     validate_triangle
    if side_a == side_b && side_b == side_c
      :equilateral
    elsif side_a == side_b || side_b == side_c || side_a == side_c
      :isosceles
    else
      :scalene
    end
  end

  def validate_triangle
    real_triangle = [(side_a + side_b > side_c), (side_a + side_c > side_b), (side_b + side_c > side_a)]
    [side_a, side_b, side_c].each do |side|
      real_triangle << false if side <= 0 
    raise TriangleError if real_triangle.include?(false)
    end
  end
  
    class TriangleError < StandardError
    # triangle error code
    end
end 
  

