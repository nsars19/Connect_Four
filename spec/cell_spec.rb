require './lib/cell'

describe "Cell" do
  let(:cell) { Cell.new 'red' }

  describe "#get_left_upper_diagonals" do
    it 'gets upper-left nodes colors' do
      node_2 = instance_double("Cell")
      node_3 = instance_double("Cell")
      allow(node_2).to receive_messages(:color => 'red')
      allow(node_3).to receive_messages(:color => 'red')
      allow(node_2).to receive_messages(:up_left => node_3)
      allow(node_3).to receive_messages(:up_left => nil)
      cell.up_left = node_2
      expect(cell.get_left_upper_diagonals).to eql ['red', 'red', 'red']
    end
  end
end