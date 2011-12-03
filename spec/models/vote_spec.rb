require 'spec_helper'

describe Vote do
  describe "associations" do
    it { should belong_to :rivalry_character }
    it { should have_one :rivalry }
  end

  describe "validations" do
    context "standard" do
      before { Factory(:vote, ip: Faker::Internet.ip_v4_address) }
      it { should validate_presence_of :ip }
      it { should validate_presence_of :rivalry_character_id }
      it { should validate_uniqueness_of :ip, scope: :rivalry_character_id }
    end

    context "ensures the format of the ip" do
      subject { Factory.build(:vote, ip: ip) }
      context "with a valid ip" do
        let(:ip) { Faker::Internet.ip_v4_address }
        it { should be_valid }
      end

      context "with an invalid ip of letters" do
        let(:ip) { "www.123.www.w" }
        it { should be_invalid }
      end

      context "with an invalid ip of numbers" do
        let(:ip) { "111111111" }
        it { should be_invalid }
      end
    end

    context "ensure uniqueness of ip per rivalry" do
      subject { Factory.build(:vote, rivalry_character: rivalry_character, ip: ip) }
      let(:ip) { Faker::Internet.ip_v4_address }
      let(:rivalry) { Factory(:rivalry) }
      let(:rivalry_character) { Factory(:rivalry_character, rivalry: rivalry) }
      before { Factory(:vote, rivalry_character: Factory(:rivalry_character, rivalry: rivalry), ip: ip) }
      it { should be_invalid }
    end
  end

  describe "vote_count counter cache" do
    subject { rivalry_character.reload }
    let!(:rivalry_character) { Factory(:rivalry_character) }
    let!(:vote) { Factory(:vote, rivalry_character: rivalry_character) }
    its(:votes_count) { should == 1 }
  end
end
