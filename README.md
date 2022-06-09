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
## Contributing

Yes please  :)

1. Fork it
1. Create your feature branch (`git checkout -b my-feature`)
1. Ensure the tests pass (`bundle exec rspec`)
1. Commit your changes (`git commit -am 'awesome new feature'`)
1. Push your branch (`git push origin my-feature`)
1. Create a Pull Request
