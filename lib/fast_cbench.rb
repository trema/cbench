# A simple openflow controller for benchmarking (fast version).
class FastCbench < Trema::Controller
  def start(_args)
    logger.info "#{name} started."
  end

  def packet_in(dpid, packet_in)
    send_message_binary dpid, flow_mod_binary(packet_in)
  end

  private

  # This method smells of :reek:FeatureEnvy
  def flow_mod_binary(packet_in)
    @flow_mod_binary ||=
      FlowMod.new(command: :add,
                  buffer_id: packet_in.buffer_id,
                  match: ExactMatch.new(packet_in),
                  actions: SendOutPort.new(packet_in.in_port + 1)).to_binary
  end
end
