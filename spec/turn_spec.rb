require './lib/card'

require './lib/turn'

RSpec.describe Turn do
  
    it 'exists' do
    turn = Turn.new("Juneau", "card_1")

    expect(turn).to be_instance_of(Turn)
  end

end
