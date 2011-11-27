require 'spec_helper'

describe Entry do
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
end
