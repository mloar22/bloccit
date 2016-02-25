require 'rails_helper'


describe "validations" do

  let(:good_v) { Vote.new(value: 1) }
  let(:bad_v) { Vote.new(value: -1) }
  let(:no_v) { Vote.new(value:  2) }

  describe "value validation" do
    it "only allows -1 or 1 as values" do
      expect(good_v.valid?).to eq(true)
      expect(bad_v.valid?).to eq(true)
      expect(no_v.valid?).to eq(false)
    end
  end
end
describe 'after_save' do
  it "calls `Post#update_rank` after save" do
    post = associated_post
    vote = Vote.new(value: 1, post: post)
    expect(post).to receive(:update_rank)
    vote.save
  end
end
