require "pry"

class MineSweeper
  
  attr_accessor :field, :row_length
  
  def initialize(field)
    @field = field
    @row_length = field.first.size
  end

  def sweep_field
    @field.each_with_index do |row, i|
      row.each_with_index do |tile, j|
        if tile == "*"
          increment(i, j)
        end
      end
    end
  end

  def increment(row_idx, tile_idx)
    #top_left corner
    @field[row_idx - 1][tile_idx -1] += 1 if row_idx > 0 && tile_idx > 0 && !mine?(row_idx-1, tile_idx-1)
    #top
    @field[row_idx - 1][tile_idx] += 1 if row_idx > 0 && !mine?(row_idx-1, tile_idx)
    #top_right corner
    @field[row_idx - 1][tile_idx + 1] += 1 if row_idx > 0 && tile_idx < 4 && !mine?(row_idx-1, tile_idx+1)
    #left
    @field[row_idx][tile_idx - 1] += 1 if tile_idx > 0 && !mine?(row_idx, tile_idx-1)
    #bottom_left corner
    @field[row_idx + 1][tile_idx - 1] += 1 if row_idx < 4 && tile_idx > 0 && !mine?(row_idx+1, tile_idx-1)
    #bottom
    @field[row_idx + 1][tile_idx] += 1 if row_idx < 4 && !mine?(row_idx+1, tile_idx)
    #bottom_right corner
    @field[row_idx + 1][tile_idx + 1] += 1 if row_idx < 4 && tile_idx < 4 && !mine?(row_idx+1, tile_idx+1)
    # right
    @field[row_idx][tile_idx + 1] += 1 if tile_idx < 4 && !mine?(row_idx, tile_idx+1)
  end

  def mine?(row_idx, tile_idx)
    @field[row_idx][tile_idx] == "*"
  end

end