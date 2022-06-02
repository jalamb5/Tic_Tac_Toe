# frozen_string_literal: true

require_relative '../lib/tic_tac_toe'

describe Board do
  describe '#mark' do
    subject(:game_board) { described_class.new }
    context 'if a player chooses X' do
      it 'updates board location with X'do
        expect do
          subject.mark('X', 2)
        end.to output("\n|_|_|_|\n|_|_|_|\n|_|_|_|\n\n| 2| 4| 6|\n|10|12|14|\n|18|20|22|\n\n| 2| 4| 6|\n|10|12|14|\n|18|20|22|\n\n|X|_|_|\n|_|_|_|\n|_|_|_|\n").to_stdout
      end
    end
  end
end
