FixtureBuilder::Configuration.class_eval do
  def rebuild_fixtures?
    (@file_hashes != read_config) || Dir.glob('spec/fixtures/**/*.yml').empty?
  end
end

FixtureBuilder.configure do |config|
  # rebuild fixtures automatically when these files change:
  config.files_to_check = Dir[Rails.root.join("spec/factories/*.rb"), "spec/support/fixture_builder.rb", "db/schema.rb"]

  # now declare objects
  config.factory do
    @rihanna = Factory(:character, name: "Rihanna")
    @beyonce = Factory(:character, name: "Beyonce")

    config.name(:user, Factory(:user, password: "test"))
    config.name(:admin, Factory(:admin, password: "test"))
  end
end
