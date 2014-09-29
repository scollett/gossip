require 'redis'
require 'json'

class Gossip
  def run
    @channel = defined?(CHANNEL) ? CHANNEL : 'gossip_server'
    @pubsub = Redis.new
    puts 'running'
    @pubsub.subscribe(@channel) do |on|
       on.message do |channel, msg|

         # message
         data = JSON.parse(msg)
         puts channel.inspect
         puts data.inspect
         exit if data['task']=='that'
       end
    end
  end
end

Gossip.new.run