cipher = %Q{
t+1vET9XRUvRW/Slr2FsiFFkqhiCKiST49RwJVXX9sbq/aMkjU9jVcl6UtNh\n
3QREfg8B/EREm6A6ahT7AJGlUbu60OX373IOihlmUSSbQWLmJnh2LPWYYLZK\n
6panQMC+EhUZD7yWu9tMIAnpJ92nslEbG6o+SMAZZYyV0Rr4LHNYRulsag1Y\n
7VZADDz9EXz1DULi/iidzKP5jV+mirx6mfL8F4V9SYLTgK2VTxpsBWuSAlIN\n
4LAK3Q1js5Df/HUnuiUzRU0aXeYwBI7O2WVQTRN7frp+Ar2xKnhMdEJucuL5\n
ydt9gD0XVNKwLK5DDybSbUARTYFubbrTpxfCSv4bxA==\n
}

key = OpenSSL::PKey::RSA.new(File.read(Rails.root.join(ENV['HOME'], '.ssh', 'id_rsa')))
GMAIL_PASSWORD = key.private_decrypt(Base64.decode64(cipher))

ActionMailer::Base.smtp_settings = {
  :user_name => "prusswan@gmail.com",
  :password => GMAIL_PASSWORD,
  :address => "smtp.gmail.com",
  :port => 587,
  :enable_starttls_auto => true
}
