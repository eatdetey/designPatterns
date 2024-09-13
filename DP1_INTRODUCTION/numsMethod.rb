#Task 4 (v7) 

#Method 1 (Метод 1 Найти сумму простых делителей числа.)
def isPrime(num)
	if num <=1 then #1 is not a prime number here
		return false
	end
	for i in 2..num/2 do
		if num % i == 0 then
			return false
		end
	end
	return true
end

def dividersSum(num)
	sum = 0
	if num == 1 then 
		return 0
	else
		if isPrime(num) then
			return num
		else
			for i in 2..num/2 do
				if num % i ==0 and isPrime(i)
					sum += i 
				end
			end
		end
	end
	return sum
end

# Method 2 (Метод 2 Найти количество нечетных цифр числа, больших 3)
def countDigitsGreaterThenThree(num)
	count = 0
	until num == 0 do
		digit = num % 10
		num /= 10
		if digit>3 and digit%2 != 0 then
			count += 1
		end
	end
	return count
end

#Method 3 (Метод 3 Найти произведение таких делителей числа, сумма цифр
#которых меньше, чем сумма цифр исходного числа.)
def digitsSum(num)
	sum = 0
	until num == 0 do
		sum += num % 10
		num /= 10
	end
	return sum
end

def dividersProduct(num)
	dSum = digitsSum(num)
	product = 1
	for i in 2..num/2 do
		if num % i == 0 and dSum > digitsSum(i) then
			product *= i
		end
	end
	return product
end


puts(dividersSum(ARGV[0].to_i))
puts(countDigitsGreaterThenThree(ARGV[1].to_i))
puts(dividersProduct(ARGV[2].to_i))
