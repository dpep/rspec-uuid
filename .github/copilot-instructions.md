# Copilot Instructions

## Project Overview

`rspec-uuid` is a Ruby gem that provides an RSpec matcher for validating UUIDs. It adds the `be_a_uuid` matcher (and its composable alias `a_uuid`) to RSpec, with support for checking UUID versions.

## Repository Structure

```
lib/
  rspec/
    uuid.rb          # Core matcher implementation
    uuid/
      version.rb     # Gem version constant
  rspec-uuid.rb      # Entry point (requires rspec/uuid)
spec/
  matchers_spec.rb   # Tests for the be_a_uuid matcher
  spec_helper.rb     # RSpec configuration and test dependencies
rspec-uuid.gemspec   # Gem specification
```

## Development Setup

```bash
bundle install
```

## Running Tests

```bash
bundle exec rspec
```

## Code Style

- Follow existing Ruby conventions in the codebase
- No linter is configured; match the style of surrounding code
- Keep the matcher implementation in `lib/rspec/uuid.rb`
- Tests live in `spec/matchers_spec.rb`

## Key Implementation Details

- The matcher is defined using `RSpec::Matchers.define :be_a_uuid`
- UUID format validated via regex: `/^\h{8}-\h{4}-(\h{4})-\h{4}-\h{12}$/`
- UUID version is extracted from the 1st nibble of the 3rd section (bits 48–51)
- `a_uuid` is an alias for composing in `include` / `match` matchers
- Supports version checking via `be_a_uuid(version: 4)` or `be_a_uuid.of_version(4)`
- Requires Ruby >= 3.3

## Dependencies

- `rspec-expectations` (runtime)
- `activesupport`, `faker`, `simplecov`, `debug` (development/test only)
