require 'trema'
require 'cbench'

describe Cbench do
  Given(:logger) { spy('logger') }
  Given(:cbench) do
    Cbench.new.tap do |controller|
      allow(controller).to receive(:logger).and_return(logger)
    end
  end

  describe '#start' do
    context 'with []' do
      When { cbench.start([]) }
      Then { expect(logger).to have_received(:info).with('Cbench started.') }
    end
  end

  describe '#packet_in' do
    When { cbench.packet_in(dpid, packet_in) }

    context 'with 0xabc, PacketIn (buffer_id: "BUFFER ID", in_port: 99)' do
      Given(:dpid) { 0xabc }
      Given(:packet_in) do
        double('packet_in').tap do |packet_in|
          allow(packet_in).to receive(:buffer_id).and_return('BUFFER ID')
          allow(packet_in).to receive(:in_port).and_return(99)
        end
      end
      Given { allow(Pio::ExactMatch).to receive(:new).with(packet_in).and_return('EXACT MATCH') }
      Given { allow(cbench).to receive(:send_flow_mod_add) }
      Then do
        expect(cbench).to have_received(:send_flow_mod_add).with(0xabc,
                                                                 match: 'EXACT MATCH',
                                                                 buffer_id: 'BUFFER ID',
                                                                 actions: Pio::SendOutPort.new(100))
      end
    end
  end
end
