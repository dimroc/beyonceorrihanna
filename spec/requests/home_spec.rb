require 'spec_helper'

describe 'home page', js: true, firebug: true do
  it 'welcomes user' do
    visit '/'
  end
end