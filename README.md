## vat-rates

Gem for fetching value added tax(VAT) by alpha2(ISO-3166-1-alpha2) code

### Usage

```ruby
VatRate.for(:ru) #=> 20.0
VatRate.for(:ru, Date.new(2019, 1, 1)) #=> 20.0
VatRate.for(:ru, Date.new(2018, 12, 31)) #=> 18.0
```
