

require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !self[num].include?(num)
      self[num] << num
      @count += 1
    end
    if @count >= num_buckets
      resize!
    end
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].each do |el|
      return true if el == num
    end
    false
  end

  private

  def [](num)
    @store[num.hash % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    @old_set = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    @old_set.each do |bucket|
      bucket.each do |el|
        insert(el)
      end
    end
  end
end
