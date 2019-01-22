module VatRate
  class Rate
    attr_reader :country_code, :value, :valid_since

    def initialize(country_code:, value:, valid_since:)
      @country_code = country_code
      @value = value
      @valid_since = valid_since
    end
  end
end
