require 'redis'
require 'json'
require 'pony'

class Gossip
  def run
    @channel = defined?(CHANNEL) ? CHANNEL : 'gossip'
    @pubsub = Redis.new
    @pubsub.subscribe(@channel) do |on|
       on.message do |channel, msg|

         # message
         data = JSON.parse(msg)
         puts data.inspect
         
    end
  end
  
  def log(data)
    STDOUT.puts data
  end
  
  def send_email(to, subject, body)
      args = {:from => 'gossip@me.com',
                :to => to,
                :subject => subject,
                :body => body}
      Pony.mail args unless environment = 'test'
  end
end

Gossip.new.run