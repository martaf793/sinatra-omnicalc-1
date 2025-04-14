require "sinatra"
require "sinatra/reloader"

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end

get("/square/new") do
  erb(:square_new)
end

get("/square/results") do
  @n=params.fetch("users_number").to_f
  @result=@n**2
  erb(:square_results)
end

get("/square_root/new") do
  erb(:square_root_new)
end
get("/square/root/results") do
  @users_n=params.fetch("users_n").to_f
  @result=@users_n**0.5
  erb(:square_root_results)
end

get("/random/new") do
  erb(:random_new)
end
get("/random/results") do
  @r1=params.fetch("r1").to_f
  @r2=params.fetch("r2").to_f
  @random_n=rand(@r1..@r2)
erb(:random_results)
end
get("/payment/new") do
  erb(:payment_new)
end

get("/payment/results") do
  @apr=params.fetch("apr").to_fs(:percentage,{:precision=>4})
  @apr_m=@apr/100/12
  @years=params.fetch("years").to_i*12
  @ppal=params.fetch("ppal").to_fs(:currency,{:precision=>2})
  @numerator= @apr_m*@ppal
  @denominator= 1-(1+@apr_m)**(-@years)
  @result=@numerator/@denominator
  erb(:payment_results)
end
