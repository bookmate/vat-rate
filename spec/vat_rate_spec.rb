require "spec_helper"

RSpec.describe VatRate do
  describe '.for' do
    subject { described_class.for(country_code) }

    let(:country_code) { :ru }

    context 'without date' do
      it 'returns actual vat rate' do
        expect(subject).to eq(20.0)
      end
    end

    context 'with date' do
      subject { described_class.for(country_code, date) }

      it 'returns vat rate actual on that date' do
        expect(described_class.for(country_code, Date.new(2017, 12, 31))).to eq(18.0)
        expect(described_class.for(country_code, Date.new(2018, 1, 1))).to eq(20.0)
      end
    end
  end
end
