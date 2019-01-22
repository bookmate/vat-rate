require 'vat_rate/version'
require 'vat_rate/rate'
require 'csv'

module VatRate
  def self.for(country_code, date = Date.today)
    country_code = country_code.to_s.upcase

    DB.fetch(country_code, date)
  end

  class DB
    DB_PATH = File.join(File.dirname(__FILE__), 'db', 'vat_rates.csv')

    def self.fetch(country_code, date)
      country_rates = rates_for_countries.fetch(country_code, [])

      rate = country_rates.
        reject { |rate| date < rate.valid_since }.
        sort_by(&:valid_since).
        last

      return unless rate

      rate.value
    end

    def self.rates_for_countries
      @rates_for_countries ||= begin
        data = CSV.read(DB_PATH, headers: true)
        accumulator = Hash.new { |hash, key| hash[key] = [] }

        data.each_with_object(accumulator) do |line, hash|
          rate = Rate.new(
            country_code: line['alpha2'],
            value: line['vat'].to_f,
            valid_since: Date.parse(line['valid_since'])
          )

          hash[rate.country_code] << rate
        end
      end
    end
  end
end
