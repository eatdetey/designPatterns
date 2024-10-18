#task 2
puts "Здравствуй, #{ARGV[0]}!"
puts 'Какой язык программирования твой любимый?'
lng = $stdin.gets.chomp

if lng != 'Ruby' 
	print 'А скоро будет Ruby! '
end

case lng 
when 'Ruby'
	puts 'Подлиза пойман!'
when 'GO'
	puts 'Амаль, закрой программу.'
when 'Python'
	puts 'Фу, Пайтон-разработчик...'
else
	puts "Отвернись от тьмы (#{lng}), перейди на сторону Ruby!"
end

#task 3

puts "Ну же, введи какую-нибудь команду Ruby:"
comm = $stdin.gets.chomp

puts eval(comm)

puts "Отлично! Теперь введи команду ОС:"
OScomm = $stdin.gets.chomp

system(OScomm)
