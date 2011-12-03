require 'spec_helper'

describe VotesController do
  context "POST /create" do
    subject { lambda { post :create, rivalry_character_id: rivalry_character.id } }
    let(:rivalry_character) { Factory(:rivalry_character) }
    it { should change { Vote.count }.by(1) }
  end
end