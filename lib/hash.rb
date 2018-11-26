class Worse_Hach
  attr_reader :db_keys, :db_vals

  def initialize
    @db_keys = []
    @db_vals = []
  end

  def has_key?(key)
    @db_keys.include?(key)
  end

  def length
    @db_keys.length
  end

  def single_store(input_key,input_val)
    @db_keys.push(input_key)
    @db_vals.push(input_val)
    self.worse_fetch(input_key)
  end

  def worse_store(*key_vals)
    key_vals.each do |x|
      y0 = x.split("=>")[0].gsub(/\s$/, '')
      y1 = x.split("=>")[1].gsub(/^\s/, '')
      if @db_keys.include?(y0)
        puts "ERROR: key #{y0} already exists"
      else
        @db_keys.push(y0)
        @db_vals.push(y1)
      end
    end

  end

  def merge!(other_worse_hash)
    other_keys = []
    other_vals = []

    other_worse_hash.db_keys.each_with_index do |key,i|
      if !@db_keys.include?(key)
        other_keys.push(other_worse_hash.db_keys[i])
        other_vals.push(other_worse_hash.db_vals[i])
      end
    end

    (@db_keys << other_keys).flatten!
    (@db_vals << other_vals).flatten!

  end

  def worse_fetch(key)

    @db_keys.each_with_index do |db_key, i|
      if db_key == key
        return @db_vals[i]
      end
    end

  end

end
