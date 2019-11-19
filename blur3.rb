class Image

  def initialize(picture)
    @image = picture
  end

  def output_image
    @image.each do |x|
      puts x.join("-")
    end
  end


  def blur(manhattan=1)
    manhattan.times do
      blur = []
      @image.each_with_index do |row, row_index|
        row.each_with_index do |position, col_index|
            blur << [row_index, col_index] if position == 1
        end
      end
     
      blur.each do |location|
        @image[location[0]][location[1] + 1] = 1 if location[1] + 1 <= @image[location[0]].length - 1
        @image[location[0]][location[1] - 1] = 1 if location[1] - 1 >= 0
        @image[location[0] + 1][location[1]] = 1 if location[0] + 1 <= @image.length - 1
        @image[location[0] - 1][location[1]] = 1 if location[0] - 1 >= 0
      end
    end
  end
end
            
 


image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 1]
])



image.output_image
puts
image.blur(2)
image.output_image