require 'redis'
require 'json'

@channel = defined?(CHANNEL) ? CHANNEL : 'gossip'
 @pubsub = Redis.new
 @pubsub.subscribe(@channel) do |on|
   on.message do |channel, msg|

     # message
     data = JSON.parse(msg)
     puts channel.inspect
     puts data.inspect

   end
 end