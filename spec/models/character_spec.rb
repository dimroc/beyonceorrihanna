require 'spec_helper'

describe Character do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  describe "#image_url" do
    context "should invalidate incorrect urls" do
      subject { lambda { character.save! } }
      let(:character) { Factory.build(:character, image_url: "wwwwwww") }
      it { character.should_not be_valid }
    end

    context "should validate correct urls" do
      subject { lambda { character.save! } }
      let(:character) { Factory.build(:character, image_url: "http://img2.timeinc.net/people/i/2008/database/rihanna/rihanna300.jpg") }
      it { character.should be_valid }
    end
  end
end
