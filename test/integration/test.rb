require File.expand_path '../../test_helper.rb', __FILE__
#require File.expand_path '../../../gossip.rb', __FILE__

class GossipTest < Minitest::Test
  
  def setup
    STDOUT.puts 'Starting up test Redis instance'
    system "redis-server #{File.expand_path '../../redis-test.conf', __FILE__}"
    sleep(0.01)
    @redis_test_instance = Redis.new({port: 10000})
  end
  
  def test_gossip
    STDOUT.puts 'Running test'
    assert true
  end

  def teardown
    STDOUT.puts 'Shutting down test Redis instance'
    @redis_test_instance.shutdown
    sleep(0.01)
  end
end