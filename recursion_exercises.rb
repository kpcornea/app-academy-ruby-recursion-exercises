def range(start, finish)
  return [] if finish < start
  return [start] if finish - 1 == start
  range(start, finish - 1) + [finish - 1]
end
