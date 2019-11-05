class Image
  def initialize(picture)
    @image = picture
  end

  def one_locations
    locations = []
    @image.each_with_index do |row, row_index|
      row.each_with_index do |position, col_index|
        if position ==1
          locations << [row_index, col_index]
        end
      end
    end
    locations
  end

  def blur
    locations = one_locations
      @image.each_with_index do |row, row_index|
        row.each_with_index do |position, col_index|
          locations.each do |found_row_number, found_col_number|

            if row_index == found_row_number && col_index == found_col_number
              @image[row_index -1][col_index] = 1 unless row_index == 0
              @image[row_index +1][col_index] = 1 unless row_index >= 3
              @image[row_index][col_index -1] = 1 unless col_index == 0
              @image[row_index][col_index +1] = 1 unless col_index >= 3
            end
          end
        end
      end
  end


  def output_image
    @image.each do |x| 
      puts x.join("-")
    end
  end
end

image = Image.new([
    [0, 0, 0, 0],
    [0, 1, 0, 0],
    [0, 0, 0, 1],
    [0, 0, 0, 0]
  ])

image.output_image
puts
image.blur

image.output_image