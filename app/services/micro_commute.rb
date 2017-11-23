class MicroCommute
  def initialize(msg, key)
    @msg = msg
    @key = key
  end
  # Micro::Broadcaster.new.ping
  def publish
    puts "~~~~~~~~~->   Start sending of #{@msg}"
    conn = Bunny.new
    conn.start
    ch   = conn.create_channel
    x    = ch.direct('ruby_hat')
    x.publish(@msg, routing_key: @key)
    puts " [x] Sent #{@msg} to #{@key}"
    conn.close
  end

  def channel
    @channel ||= connection.create_channel
  end

  def connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end
end
