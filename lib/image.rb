class Image 
  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def blur
    @blurred = Marshal.load(Marshal.dump(@data))
    @data.each_with_index do |row, row_number| 
      row.each_with_index do |element, index| 
        if element == 1
          @blurred[row_number][index - 1] = 1 unless index == 0
          @blurred[row_number][index + 1] = 1 unless (index + 1) >= row.length  
          @blurred[row_number - 1][index] = 1 unless row_number == 0
          @blurred[row_number + 1][index] = 1 unless (row_number + 1) >= @data.length
        end
      end
    end
    Image.new(@blurred)
  end
end