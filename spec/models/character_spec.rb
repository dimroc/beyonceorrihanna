require 'spec_helper'

describe Character do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  describe "urls" do
    [:image_url, :youtube_url].each do |attribute|
      context "should invalidate an incorrect #{attribute}" do
        subject { lambda { character.save! } }
        let(:character) { Factory.build(:character, attribute => "wwwwwww") }
        it { character.should_not be_valid }
      end

      context "should validate a correct #{attribute}" do
        subject { lambda { character.save! } }
        let(:character) { Factory.build(:character, attribute => "http://img2.timeinc.net/people/i/2008/database/rihanna/rihanna300.jpg") }
        it { character.should be_valid }
      end
    end
  end
end
