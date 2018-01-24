require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(100)

def check_guess user_guess
  if user_guess == SECRET_NUMBER
    msg = "You got it right!"
  elsif user_guess > SECRET_NUMBER
    if (user_guess - 5) <= SECRET_NUMBER
      msg = "Too high!"
    else
      msg = "Way too high!"
    end
  elsif user_guess < SECRET_NUMBER
    if (user_guess + 5) >= SECRET_NUMBER
      msg = "Too low!"
    else
      msg = "Way too low!"
    end
  end
  msg
end


get '/' do
  user_guess = params["guess"].to_i
  message = check_guess(user_guess)
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
end
