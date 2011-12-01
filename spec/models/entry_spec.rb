require 'spec_helper'

describe Entry do
  describe "associations" do
    it { should belong_to :character }
    it { should belong_to :rivalry }
    it { should have_many :votes }
  end

  describe "validations" do
    it { should validate_presence_of :character_id }
    it { should validate_presence_of :rivalry_id }
    it { should validate_uniqueness_of :character_id, scope: :rivalry_id }
  end

  describe "factories work" do
    subject { entry }
    let(:entry) { Factory(:entry) }
    its(:character) { should_not be_nil }
    its(:rivalry) { should_not be_nil }
  end

  describe ".vote!" do
    subject { lambda { entry.vote!(Faker::Internet.ip_v4_address) } }
    let(:entry) { Factory(:entry) }
    it { should change { entry.rivalry.votes.count }.by(1) }
  end
end
