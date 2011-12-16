require 'spec_helper'

describe RivalryCharacter do
  describe "associations" do
    it { should belong_to :character }
    it { should belong_to :rivalry }
    it { should have_many :votes }
  end

  describe "scopes" do
    context "ordered" do
      subject { rivalry.rivalry_characters.ordered }
      let(:rivalry) { Factory(:rivalry) }
      let(:rivalry_character_list) do
        t = []
        4.times { t << Factory(:rivalry_character, rivalry: rivalry) }
        t
      end
      it { should =~ rivalry_character_list }
    end
  end

  describe "validations" do
    it { should validate_presence_of :character_id }
    it { should validate_presence_of :rivalry_id }
    it { should validate_uniqueness_of :character_id, scope: :rivalry_id }
  end

  describe "factories work" do
    subject { rivalry_character }
    let(:rivalry_character) { Factory(:rivalry_character) }
    its(:character) { should_not be_nil }
    its(:rivalry) { should_not be_nil }
  end

  describe ".vote!" do
    subject { lambda { rivalry_character.vote!(Faker::Internet.ip_v4_address) } }
    let(:rivalry_character) { Factory(:rivalry_character) }
    it { should change { rivalry_character.rivalry.votes.count }.by(1) }
  end
end
