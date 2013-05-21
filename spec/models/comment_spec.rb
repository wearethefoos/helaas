require 'spec_helper'

describe Comment do
  it { should validate_presence_of :content }
end
