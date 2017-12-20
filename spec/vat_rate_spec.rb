require "spec_helper"

RSpec.describe VatRate do
  describe '.for' do
    subject { described_class.for(country_code) }
    let(:country_code) { :ru }

    specify do
      expect(subject).to eq 18.0
    end
  end
end
