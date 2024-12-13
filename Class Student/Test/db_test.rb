require 'pg'

begin
  # Подключение к базе данных
  conn = PG.connect(
    dbname: 'students',  # Имя базы данных
    user: 'postgres',    # Имя пользователя PostgreSQL
    password: 'admin',  # Пароль пользователя
    host: 'localhost',   # Хост (localhost для локальной машины)
    port: 5434           # Порт (по умолчанию 5432)
  )

  # Выполнение SELECT запроса
  result = conn.exec("SELECT * FROM student;")

  # Вывод результатов
  result.each do |row|
    puts row  # Каждая строка возвращается как хеш
  end

rescue PG::Error => e
  puts "Ошибка подключения или выполнения запроса: #{e.message}"

ensure
  # Закрытие подключения к базе данных
  conn.close if conn
end
