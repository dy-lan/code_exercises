def fibonacci(num)
  fib = [0, 1]

  (2...num).each do |i|
    fib[i] = fib[i - 2] + fib[i - 1]
  end

  fib
end

fib = fibonacci(10)
puts fib.join(' ')
