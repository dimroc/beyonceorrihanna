require 'spec_helper'

describe Character do
  it { should validate_presence_of :name }
end
