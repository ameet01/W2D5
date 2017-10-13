# # Phase 2: Hashing
# #
# # A hash function is a sequence of mathematical operations that deterministically maps
# any arbitrary data into a pre-defined range of values. Anything that does that is a hash function.
# However, a good hash function satisfies the property of being uniform in how it distributes that
# data over its range of values.
# #
# # To create a good hash function, we want to be able to hash absolutely anything. That
# includes integers, strings, arrays, and even other hashes.
# #
# # Also, a hash function should be deterministic, meaning that it should always produce
# the same value given the same input. It's also essential that equivalent objects produce the same
# hash. So if we have two arrays, each equal to [1, 2, 3], we want them both to hash to the same value.
# #
# # So let's construct a nice hashing function that'll do that for us. Be creative here!
# #
# # Write hash functions for Array, String, and Hash. Build these up sequentially.
# #
# # Use Fixnum#hash as a base hashing function. The trick here will be to create a scheme
# to convert instances of each class to a Fixnum and then apply this hashing function. This can be
# used on Numerics such as the index of an array element.
# # Don't try to overwrite Ruby's native Fixnum#hash; making a hash function for numbers
# is something that's outside the scope of this assignment.
# # Ordering of elements is essential to hashing an Array or String. This means each element
# in an Array or String should be associated with its index during hashing. Ex. [1, 2, 3].hash ==
# [3, 2, 1].hash # => false
# # On the other hand, ordering is not to be considered with a Hash. Hashes are based on sets
# and have no fixed order. Ex. {a: 1, b: 2}.hash == {b: 2, a: 1}.hash # => true

class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    num = 0
    self.each_with_index do |i, j|
      num += i ^ j.hash
    end
    num
  end
end

class String
  def hash
    num = 0
    self.split('').each_with_index do |i,j|
      num += i.ord.hash ^ j
    end
    num
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    num = 0
    self.each do |k, v|
      num +=  k.hash ^ v.hash
    end
    num
  end
end
