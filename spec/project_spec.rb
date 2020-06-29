# spec/project_spec.rb
require_relative '../lib/player'
require_relative '../lib/board'
require_relative '../lib/game'

describe Game do
  player1 = 'Houda'
  player2 = 'Angel'
  let(:game1) { Game.new(player1, player2) }
  describe 'initialize' do
    it 'testing initialize method' do
      expect(game1.player1).to eql(player1)
      expect(game1.player2).to eql(player2)
    end
  end
end

describe Player do
  let(:player_test1) { Player.new('X', 'player1', [1, 4, 7]) }
  let(:player_test2) { Player.new('X', 'player2', [1, 3, 7]) }
  let(:player_test3) { Player.new('O', 'player3', [1, 3, 4]) }
  describe '#winner?' do
    it 'player2 is not a winner' do
      expect(player_test2.winner?).not_to eql(true)
    end
    it 'player 1 is a winner' do
      expect(player_test1.winner?).to eql(true)
    end
  end
  context 'testing a draw situation when no player is a winner' do
    it 'it s a draw , no player is winining' do
      expect(player_test2.winner? && player_test3.winner?).not_to eql(true)
    end
  end
end

describe Board do
  let(:test_board2) { Board.new([1, 2, 'X']) }
  let(:test_board3) { Board.new(%w['X O X']) }
  describe '#grid_filled?' do
    it 'grid is not completely filled with strings' do
      expect(test_board2.grid_filled?).not_to eql(true)
    end
    it 'grid is completely filled with strings' do
      expect(test_board3.grid_filled?).to eql(true)
    end
  end
  let(:test_pick1) { 9 }
  let(:test_pick2) { 10 }
  describe '#pick_valid?' do
    it 'position picked is a valid position' do
      expect(test_board2.pick_valid?(test_pick1)).to eql(true)
    end
    it 'position picked is not a valid position' do
      expect(test_board2.pick_valid?(test_pick2)).not_to eql(true)
    end
  end
  let(:test_not_picked1) { 2 }
  let(:test_not_picked2) { 3 }
  describe '#not_picked?' do
    it 'position not picked yet?' do
      expect(test_board2.not_picked?(test_not_picked1)).to eql(true)
    end
    it 'position already picked?' do
      expect(test_board2.not_picked?(test_not_picked2)).not_to eql(true)
    end
  end
  let(:pick) { 2 }
  let(:totem) { 'X' }
  describe '#update_grid' do
    it 'update the grid of the bord by puting the totem in the right position' do
      expect(test_board2.update_grid(pick, totem)).to eq([1, 'X', 'X'])
    end
  end
end
