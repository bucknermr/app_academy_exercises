class Array
  def my_each(&block)
    (0).upto(self.length - 1) do |i|
      if block_given?
        block.call(self[i])
      else
        self[i]
      end
    end
    self
  end

  def my_select(&block)
    answer = []
    my_each do |el|
      answer << el if block.call(el)
    end
    answer
  end

  def my_reject(&block)
    answer = []
    my_each do |el|
      answer << el unless block.call(el)
    end
    answer

  end

  def my_any?(&block)
    my_each do |el|
      return true if block.call(el)
    end
    false
  end

  def my_flatten
    results = []
    my_each do |el|
      if el.is_a?(Array)
        el.my_flatten.my_each do |el2|
          results << el2
        end
      else
        results << el
      end
    end
    results
  end

  def my_zip(*arr2)
    results = []
    self.each_with_index do |el, i|
      sub_array_result = [el]
      arr2.my_each do |arg_array|
        sub_array_result << arg_array[i]
      end
      results << sub_array_result
    end
    results
  end

  def my_rotate(num = 1)
    if num < 0
      num = length - num.abs
    end
    num = num % (self.length)
    drop(num) + take(num)
  end

  def my_join(separator = '')
    results = ''
    each_with_index do |el, i|
      results << el.to_s
      results << separator unless i == length - 1
    end
    results
  end

  def my_reverse
    results = []
    (length - 1).downto(0) do |i|
      results << self[i]
    end
    results
  end

end
