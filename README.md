rspec-uuid
======
![Gem](https://img.shields.io/gem/dt/rspec-uuid?style=plastic)
[![codecov](https://codecov.io/gh/dpep/rspec-uuid/branch/main/graph/badge.svg)](https://codecov.io/gh/dpep/rspec-uuid)


An RSpec matcher for UUIDs.

```ruby
require "rspec/uuid"


it { is_expected.to be_a_uuid }

# check the version
it { is_expected.to be_a_uuid(version: 4) }
it { is_expected.to be_a_uuid.of_version(4) }

# compose with other matchers
it { expect(data).to include(uuid: a_uuid) }
```


----
## Installation

```ruby
# Gemfile
gem "rspec-uuid"
```

or

```
gem install rspec-uuid
```
