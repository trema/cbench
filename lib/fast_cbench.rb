# A simple openflow controller for benchmarking (fast version).
class FastCbench < Trema::Controller
  def start(_args)
    logger.info "#{name} started."
  end

  def packet_in(dpid, packet_in)
    @flow_mod_binary ||= create_flow_mod(packet_in).to_binary
    send_message_binary dpid, @flow_mod_binary
  end

  private

  def create_flow_mod(packet_in)
    FlowMod.new(command: :add,
                priority: 0,
                transaction_id: 0,
                idle_timeout: 0,
                hard_timeout: 0,
                buffer_id: packet_in.buffer_id,
                match: ExactMatch.new(packet_in),
                actions: SendOutPort.new(packet_in.in_port + 1))
  end
end
