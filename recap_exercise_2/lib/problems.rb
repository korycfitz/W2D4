# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
require 'byebug'
def least_common_multiple(num_1, num_2)
    num1_mults = []
    num2_mults = []
    max = num_1 * num_2
    i = 2
    while i <= max
        if (multiples(num_1).include?(i)) && (multiples(num_2).include?(i)) 
            return i
        end
    i += 1
    end
end

def multiples(n) #use rel n for max
    multiples = [n, n+n, n+n+n, n+n+n+n, n+n+n+n+n]
    multiples
end





# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
def most_frequent_bigram(str)
    #2 adjacent letters that appear most in string
    count = Hash.new(0)
    (0...str.length).each do |start_idx|
        (start_idx...str.length).each do |end_idx|
        
            if str[start_idx..end_idx].length == 2
                count[str[start_idx..end_idx]] += 1
            end

        end
    end

    max_pair = count.max_by {|k,v| v}
    max_pair[0]
end


class Hash
    # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
    def inverse
        new = Hash.new
        keys = self.values
        self.each do |k,v|
            new[v] = k
        end
        return new
    end
end


class Array
    # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
    def pair_sum_count(num)
        counter = 0
        pairs = self.combination(2).to_a
        pairs.each {|pair| counter += 1 if pair.sum == num }
        return counter
    end

    # Write a method, Array#bubble_sort, that takes in an optional proc argument.
    # When given a proc, the method should sort the array according to the proc.
    # When no proc is given, the method should sort the array in increasing order.
    #
    # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
    # two parameters, which represents the two elements in the array being compared.
    # If the block returns 1, it means that the second element passed to the block
    # should go before the first (i.e. switch the elements). If the block returns -1,
    # it means the first element passed to the block should go before the second
    # (i.e. do not switch them). If the block returns 0 it implies that
    # it does not matter which element goes first (i.e. do nothing).
    #
    # This should remind you of the spaceship operator! Convenient :)
    def bubble_sort(&prc)
        if prc.nil?
            sorted = false

            while !sorted #while not sorted (sorted = false)
            sorted = true   #set flag to true so we can stop eventually after no more swaps

                (0...self.length - 1).each do |i|
                    if self[i] > self[i+1] #if out of order
                        self[i], self[i+1] = self[i+1], self[i] #swap
                        sorted = false #since we made swap set flag to flase
                    end
                end
            end

            self
        else
            return self.sort_by { |ele| prc.call(ele) }
        end

    end

end




