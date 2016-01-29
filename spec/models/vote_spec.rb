require 'rails_helper'

class vote
  def valid?
      (@vote == 1) || (@vote == -1)
  end
end

describe "validations" do
  let(:good_v){Vote.new(value: 1)}
  let(:bad_v){Vote.new (value: -1)}
  let(:no_v){Vote.new (value: 2)}

  describe "value validation" do
    it "only allows -1 or 1 as values" do
      expect(good_v.valid?).to eq (true)
      expect(bad_v.valid?).to eq (true)
      expect(no_v.valid?).to eq (false)

    end
  end
end
#   describe "validations" do
#     describe "value validation" do
#       it "only allows -1 or 1 as values" do
#         expect(vote.value).to eq(value)
#
#       end
#     end
#   end
# end
