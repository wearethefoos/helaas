require 'spec_helper'

describe Post do
  it { is_expected.to validate_presence_of :content }
end
