require 'spec_helper'

describe Rivalry do
  describe "factories work" do
    subject { rivalry }
    let(:rivalry) { Factory(:pair_rivalry) }
    its(:characters) { should have(2).items }
    its(:rivalry_characters) { should have(2).items }
  end

  describe "#to_s" do
    subject { rivalry.to_s }
    let(:rivalry) { Factory(:pair_rivalry) }
    it { should == rivalry.characters[0].name + " vs " + rivalry.characters[1].name }
  end
end
