# factorio-cookbook

## Scope

This cookbook focuses building a machine for [factorio][factorio].

## Requirements

- Chef 12.0.0 or higher
- Ubuntu 14.04 or higher

## Usage

- Run `bundle install` to install the dependencies.
- If you would like to spin something up in Digital Ocean, use the [kitchen-digitalocean][kitchen-digitalocean] driver and configure it.
- Either set the [default.rb](recipes/default.rb) as in your `run_list`.
- OR
- For digital ocean `KITCHEN_YAML=.kitchen.cloud.yml bundle exec kitchen verify` to spin up an instance.

### default.rb

Standard provisioning for everything you need to run factorio.

## Contributing
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

## License and Authors
- Author:: JJ Asghar (jj@chef.io)

```text
Copyright 2015 JJ Asghar

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
[factorio]: http://www.factorio.com/download-headless/stable
[kitchen-digitalocean]: https://github.com/test-kitchen/kitchen-digitalocean
