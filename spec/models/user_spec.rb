require 'spec_helper'

describe User do
  describe '.domain_from_email' do
    let(:emails) { %w(foo@springest.com bar@springest.biz boo@springe.st) }
    subject { emails.map { |e| User.domain_from_email(e) } }

    it { is_expected.to eq %w(springest.com springest.biz springe.st) }
  end
end
