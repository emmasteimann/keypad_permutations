class ListPossibles

  @@amount = 0

  @@key_pad = { 
    2 => ["A","B","C"],
    3 => ["D","E","F"],
    4 => ["G","H","I"],
    5 => ["J","K","L"],
    6 => ["M","N","O"],
    7 => ["P","Q","R","S"],
    8 => ["T","U","V"],
    9 => ["W","X","Y","Z"]
  }

  class << self
    
    def key_pad
      @@key_pad
    end
    
    def retrieve_possibilities(key_string)
      @@amount = 0
      key_string = key_string.split(//)
      possibility_amounts = []
      
      key_string.each do |key_int|
        possibility_amounts << @@key_pad[key_int.to_i].dup
      end
      recurse("", possibility_amounts, 0)
      puts "Total permutations: #{@@amount}"
    end
    
    private
    
    def recurse(key_string, arrs, idx)
      if idx == arrs.length
        @@amount = @@amount+1
        puts key_string
      else
        for value in arrs[idx]
          recurse(key_string + value, arrs, idx + 1)
        end
      end
    end
  end

end

# Random test, feel free to input whatever
ListPossibles.retrieve_possibilities "2372"