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

  context "fetches rows & columns" do
    let(:game) { Board.new }
    
    describe "#get_horizontals" do
      it 'returns nested arrays with strings' do
        game.board.each do |row|
          7.times { |i| row[i] = cell }
        end
        colors = ['red', 'red', 'red', 'red', 'red', 'red', 'red']
        grid = Array.new(6) { colors }
        expect(cell.get_horizontals(game.board)).to eql grid
      end
    end
  
    describe "#get_verticals" do
      it 'returns nested arrays with strings' do
        game.board.each do |row|
          7.times { |i| row[i] = cell }
        end
        colors = ['red', 'red', 'red', 'red', 'red', 'red']
        grid = Array.new(7) { colors }
        expect(cell.get_verticals(game.board)).to eql grid
      end
    end

    describe '#get_diagonals' do
      let(:left_1) { Cell.new 'black' }
      let(:left_2) { Cell.new 'black' }
      let(:right_1) { Cell.new 'black' }
      let(:right_2) { Cell.new 'red' }
      it 'returns nested arrays with strings' do
        cell.upper_left = left_1; left_1.upper_left = left_2
        cell.lower_right = right_1; right_1.lower_right = right_2
        colors = [['red', 'black', 'red', 'black', 'black'],['red']]
        expect(cell.get_diagonals).to eql colors
      end
    end
  end

  context "finding win conditions" do
    let(:true_row) { ['red', 'red', 'red', 'red'] }
    let(:false_row) { ['red', 'red', 'black', 'red'] }
    
    # Create examples for each of the _win? methods
    # examples check for true with four-in-a-row of the same color
    # and check for false without four-in-a-row of the same color 
    ["horizontal_win?", "vertical_win?"].each do |method|
      describe "##{method}" do
        it "returns true with four in a row" do
          expect(cell.send("#{method}", true_row)).to be true
        end

        it "returns false without four in a row" do
          expect(cell.send("#{method}", false_row)).to be false
        end
      end
    end

    describe "#diagonal_win?" do
      let(:row_true) { [['red', 'red', 'red', 'red'], ['red','red','black']]}
      let(:row_false) { [['red','red'], ['black', 'red']]}
      it "returns true with four in a row" do
        expect(cell.diagonal_win?(row_true)).to be true
      end
      it "returns false without four in a row" do
        expect(cell.diagonal_win?(row_false)).to be false
      end
    end
  end
end