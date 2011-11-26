require 'spec_helper'

describe Character do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }

  describe "urls" do
    [:image_url].each do |attribute|
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

  describe "#twitter_tag_list" do
    subject { character.twitter_tag_list }

    context "when empty" do
      let(:character) { Factory(:character, twitter_tags: "") }
      it { should be_empty }
    end

    context "when containing one tag" do
      let(:character) { Factory(:character, twitter_tags: "#sometag") }
      it { should == ["#sometag"] }
    end

    context "when containing tags" do
      let(:character) { Factory(:character, twitter_tags: "#sometag, $AMZN,#rihfacts") }
      it { should =~ %w(#sometag $AMZN #rihfacts) }
    end
  end

  describe "#youtube_url" do
    subject { character.youtube_url }
    context "when empty" do
      let(:character) { Factory.build(:character, youtube_id: "") }
      it { should be_nil }
    end

    context "when containing an id" do
      let(:character) { Factory.build(:character, youtube_id: "123456") }
      it { should == Character::YOUTUBE_FORMAT % character.youtube_id }
    end
  end
end
