require "vat_rate/version"
require 'csv'

DB_PATH = 'lib/db/vat_rates.csv'.freeze

module VatRate
  def self.for(country_code)
    country_code = country_code.to_s.upcase

    DB.fetch[country_code]
  end

  class DB
    def self.fetch
      @data ||= begin
        data = CSV.read(DB_PATH, headers: true)

        data.each_with_object({}) do |line, hash|
          hash[line['alpha2']] = line['vat'].to_f
        end
      end
    end
  end
end
