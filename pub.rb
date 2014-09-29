require 'redis'
require 'json'

CHANNEL = 'gossip_server'

redis = Redis.new

1.times do
  job = {task: 'that'}.to_json
  redis.rpush 'task', job
  redis.publish CHANNEL, job
end