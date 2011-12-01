require 'spec_helper'

describe VotesController do
  context "POST /create" do
    subject { lambda { post :create, entry_id: entry.id } }
    let(:entry) { Factory(:entry) }
    it { should change { Vote.count }.by(1) }
  end
end