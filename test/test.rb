require File.expand_path '../test_helper.rb', __FILE__
require File.expand_path '../../gossip.rb', __FILE__

class GossipTest < Minitest::Test

  def test_gossip
    Gossip.new.run
    assert true
  end

end