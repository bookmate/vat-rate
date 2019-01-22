This project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## Prerelease versions

According to https://semver.org/#spec-item-4 0.x versions should not be considered as stable, anything can change at any time.

## [Unreleased]

## 0.2.1 - 2019-01-22

#### Compatible changes:

- Add ability to fetch VAT rate actual on a particular date. E.g.

  ```ruby
  VatRate.for(:ru, Date.new(2019, 1, 1)) #=> 20.0
  ```
