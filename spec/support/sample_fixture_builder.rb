#require 'vcr'
#
#VCR.config do |c|
#  c.cassette_library_dir = 'spec/cassettes'
#  c.stub_with :webmock
#end
#
#VCR.insert_cassette "facebook"
#
#FixtureBuilder.configure do |config|
#  config.files_to_check += Dir["spec/factories/*.rb", "spec/support/fixture_builder.rb", "db/schema.rb"]
#
#  config.factory do
#    %w[Federalist Democratic-Republican].each do |name|
#      Factory(:party, :name => name)
#    end
#
#    State::NAMES.each do |name, abbreviation, region|
#      State.create(name: name,
#                   abbreviation: abbreviation,
#                   region: region)
#    end
#
#    Factory(:fiscal_issue)
#    Factory(:foreign_issue)
#    Factory(:social_issue)
#
#    [:president_race, :senate_race, :house_race].each do |race_type|
#      config.name(race_type, Factory(race_type))
#    end
#
#    senate_race_1 = Factory(:senate_race, state: State.order("name").first)
#    senate_race_2 = Factory(:senate_race, state: State.order("name").second)
#    config.name(:senate_candidate_1, Factory(:candidacy, state: "running", race: senate_race_1).politician)
#    config.name(:senate_candidate_2, Factory(:candidacy, state: "running", race: senate_race_2).politician)
#
#    config.name(:president_candidate, Factory(:president_candidate,
#                                              :previous_occupation => "Businessperson, Academic",
#                                              :facebook_url => "http://www.facebook.com/barackobama",
#                                              :twitter_name => "barackobama"))
#
#    config.name(:member, Factory(:user))
#    config.name(:admin, Factory(:admin_user))
#
#    config.name(:facebook, Factory(:user, :email => "cgbrbua_bharambesky_1317051272@tfbnw.net", :facebook_uid => 100002988411467))
#  end
#end
#
#VCR.eject_cassette
