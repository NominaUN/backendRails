class Rack::Attack
  throttle('req/ip', :limit => 3, :period => 5.minutes) do |req|
    req.ip 
  end
end