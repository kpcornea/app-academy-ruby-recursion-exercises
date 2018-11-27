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
