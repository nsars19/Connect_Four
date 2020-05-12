require './lib/cell'

describe "Cell" do
  let(:cell) { Cell.new 'red' }
  let(:node_2) { instance_double("Cell") }
  let(:node_3) { instance_double("Cell") }
  let(:colors) { ['red', 'red', 'red'] }

  ["upper", "lower"].each do |up_down|
    ["left", "right"].each do |left_right|
      describe "#get_#{up_down}_#{left_right}_diagonals" do
        it "gets #{up_down}-#{left_right} nodes colors" do
          [node_2, node_3].each do |node|
            allow(node).to receive_messages(:color => "red")
          end
          allow(node_2).to receive_messages("#{up_down}_#{left_right}" => node_3)
          allow(node_3).to receive_messages("#{up_down}_#{left_right}" => nil)
          cell.send("#{up_down}_#{left_right}=", node_2)
          expect(cell.send("get_#{up_down}_#{left_right}_diagonals")).to eql colors
        end
      end
    end
  end
end