# Acme Basket (Ruby) - Proof of Concept

This repository contains a lightweight Ruby implementation of the Acme Widget Co basket exercise.

## Design Highlights

- Clear separation of concerns (Product, Catalogue, Basket, Offers, Delivery rules)

- Dependency injection: `Basket` is initialized with catalogue, delivery rules and offers

- Strategy pattern for offers (each offer implements `Offer#apply`)

- Tests with RSpec demonstrating expected totals

- Deterministic money formatting: totals are truncated to 2 decimal places (see NOTE below)

## How to run

1. Install gems:

```bash
bundle install
```

2. Run tests:

```bash
bundle exec rspec
```

## NOTE about rounding/truncation

The expected example totals in the exercise (e.g. `$54.37` for two red widgets) imply truncation to two decimal places rather than rounding. This implementation truncates the final amount to 2 decimal places to match the expected outputs.
