require "byebug"

def range(start, finish)
  return [] if finish < start
  return [start] if finish - 1 == start
  range(start, finish - 1) + [finish - 1]
end

def sum_array_iterative(arr)
  count = arr.first

  i = 1
  while i < arr.length
    num = arr[i]
    count += num

    i += 1
  end

  count
end

def sum_array_recursive(arr)
  return arr.last if arr.length == 1 || arr.empty?
  arr.last + sum_array_recursive(arr[0...-1])
end

# arr = [1, 2, 3, 4]

def exp1(b, n)
  return 1 if n == 0
  p b * exp1(b, n - 1)
end

# version with stack trace printed

# def exp2(b, n)
#   # puts "returning 1" if n == 0
#   # return 1 if n == 0
#   puts "returning b" if n == 1
#   return b if n == 1
#   puts "even" if n.even?
#   even_ans = exp2(b, n / 2) ** 2 if n.even?
#   # return exp2(b, n / 2) ** 2 if n.even?
#   return even_ans if n.even?
#   puts "odd" if n.odd?
#   odd_ans = b * (exp2(b, (n - 1) / 2) ** 2) if n.odd?
#   # b * (exp2(b, (n - 1) / 2) ** 2) if n.odd?
#   odd_ans if n.odd?
# end

# version with exponentiation included by accident lol
# def exp2(b, n)
#   return 1 if n == 0
#   return b if n == 1
#   return exp2(b, n / 2) ** 2 if n.even?
#   b * (exp2(b, (n - 1) / 2) ** 2) if n.odd?
# end

def exp2(b, n)
  return 1 if n == 0
  return b if n == 1
  if n.even?
    partial = exp2(b, n / 2)
    return partial * partial
  else
    partial = exp2(b, (n - 1) / 2)
    return b * (partial * partial)
  end
end



class Array

  def deep_dup
    return self.dup if self.flatten == self
    self.map do |ele|
      if ele.is_a?(Array)
        ele.deep_dup
      else
        ele
      end
    end
  end

end



# 1, 1, 2, 3, 5, 8, etc

# iterative using helper factory method
# def fibo_iterative(n) # n == number of fibo numbers requested
#   arr = []
#   i = n
#   until arr.length == n
#     arr.unshift(fibo_factory(i))
#     i -= 1
#   end
#   arr
# end
#
# def fibo_factory(n)
#   return 1 if n == 1
#   return 1 if n == 2
#   fibo_factory(n - 1) + fibo_factory(n - 2)
# end

def fibo_iterative(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  arr = [1, 1]
  i = 2
  until arr.length == n
    arr << arr[i - 1] + arr[i - 2]
    i += 1
  end
  arr
end

def fibo_recursive(n)
  return [1] if n == 1
  return [1, 1] if n == 2
  last = fibo_recursive(n - 1)
  last << last[-1] + last[-2]
end


# binary search only works on sorted arrays. return location (index) of found object or nil if not found
# compare to middle element, then if not it, search corresponding half
# start with odd number of elements then do even - doesn't matter
def bsearch(array, target)
  return nil if array.empty?

  mid_idx = array.length / 2
  mid_ele = array[mid_idx]

  return mid_idx if target == mid_ele

  if target < mid_ele
    sub_arr = array[0...mid_idx]
    return bsearch(sub_arr, target)
  else
    sub_arr = array[mid_idx + 1..-1]
    next_search = bsearch(sub_arr, target)
    return nil if next_search == nil
    return mid_idx + 1 + next_search
  end
end

# examples
# bsearch([1, 2, 3], 1) # => 0
# bsearch([2, 3, 4, 5], 3) # => 1
# bsearch([2, 4, 6, 8, 10], 6) # => 2
# bsearch([1, 3, 4, 5, 9], 5) # => 3
# bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# bsearch([1, 2, 3, 4, 5, 7], 6) # => nil


def merge_sort(arr)
  return arr if arr.length <= 1

  if arr.length.odd?
    mid_idx = arr.length / 2
  else
    mid_idx = arr.length / 2 - 1
  end

  first_half = arr[0..mid_idx]
  second_half = arr[mid_idx + 1..-1]

  fh_split = merge_sort(first_half)
  sh_split = merge_sort(second_half)

  merge(fh_split, sh_split)
end

def merge(arr1, arr2)
  new_arr = []
  i = 0
  j = 0

  while i < arr1.length || j < arr2.length
    fh_ele = arr1[i]
    sh_ele = arr2[j]
    if fh_ele == nil
      new_arr << sh_ele
      j += 1
    elsif sh_ele == nil
      new_arr << fh_ele
      i += 1
    elsif fh_ele < sh_ele
      new_arr << fh_ele
      i += 1
    else
      new_arr << sh_ele
      j += 1
    end
  end

  new_arr
end

# arr = [38, 27, 43, 3, 9, 82, 10]
