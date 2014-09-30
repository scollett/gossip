require 'redis'
require 'json'

CHANNEL = 'gossip'

redis = Redis.new

test = {id: 'ABC123', 								
 process: 'robo-kat',					
 status: 'start || complete || ??',							
 
 payload: {ticket: 'HTS-1234', id: 'umi.12345677'},				
 
 fatalities: [{name: 'Unable to authenticate against JIRA site.', 
 							   id: '', 
							   stacktrace: 'blah blah line 363'}],
							 
 errors: [{name: 'unable to add comment on HTS-1234', 
 					   id: 'umi.12345677'}],

 warnings: []
}

1.times do
  job = test.to_json
  # redis.rpush 'dirt', job
  redis.publish CHANNEL, job
end