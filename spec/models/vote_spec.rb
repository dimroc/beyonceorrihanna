require 'spec_helper'

describe Vote do
  describe "associations" do
    it { should belong_to :entry }
    it { should have_one :rivalry }
  end

  describe "validations" do
    context "standard" do
      before { Factory(:vote, ip: Faker::Internet.ip_v4_address) }
      it { should validate_presence_of :ip }
      it { should validate_presence_of :entry_id }
      it { should validate_uniqueness_of :ip, scope: :entry_id }
    end

    context "ensure uniqueness of ip per rivalry" do
      subject { Factory.build(:vote, entry: entry, ip: ip) }
      let(:ip) { Faker::Internet.ip_v4_address }
      let(:rivalry) { Factory(:rivalry) }
      let(:entry) { Factory(:entry, rivalry: rivalry) }
      before { Factory(:vote, entry: Factory(:entry, rivalry: rivalry), ip: ip) }
      it { should be_invalid }
    end
  end

  describe "vote_count counter cache" do
    subject { entry.reload }
    let!(:entry) { Factory(:entry) }
    let!(:vote) { Factory(:vote, entry: entry) }
    its(:votes_count) { should == 1 }
  end
end
