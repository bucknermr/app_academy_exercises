
def factors(num)
  results = []
  (1..num.abs).each do |n|
    results << n if num % n == 0
  end
  results
end

class Array
  def bubble_sort!(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    sorted = false
    until sorted == true
      sorted = true
      self.each_index do |i|
        next if i == length - 1
        if prc.call(self[i], self[i+1]) == 1
          sorted = false
          self[i], self[i+1] = self[i+1], self[i]
        end
      end
    end
    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!(&prc)
  end

  def bubble_sort_cons(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    sorted = false
    until sorted == true
      sorted = true
      self.each_cons(2).with_index do |pair, i|
        if prc.call(pair.first, pair.last) == 1
          sorted = false
          swap_order(i, i + 1)
        end
      end
    end
    self
  end

  def swap_order(i, j)
    self[i], self[j] = self[j], self[i]
    self
  end
end


def substrings(string)
  results = []
  string.each_char.with_index do |_, i|
    (i...string.length).each do |j|
      results << string[i..j]
    end
  end
  results
end

def subwords(word, dictionary)
  arr = substrings(word)
  arr.select { |substring| dictionary.include?(substring) }
end
