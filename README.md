# EasyTranslation

easy_translation uses the ChatGPT API for providing two features.

1. To translate a single sentence into selected languages.
2. To translate the values of YML file into selected languages.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'easy_translation'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install easy_translation

## Usage

After the installation, first require the class in your file

    require 'chat_gpt_service'

then initialize the ChatGPT service with your API key

    chat_gpt = ChatGptService.new('your_api_key')

and then call the translate method on the string.

    chat_gpt.translate('your_string', [array_of_languages])

this will return the translated string into the required languages.

or if you want to translate your YML file

    chat_gpt.translate(your_file_object, [array_of_languages])

this will download the translated yml file.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/easy_translation. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/easy_translation/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EasyTranslation project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/easy_translation/blob/master/CODE_OF_CONDUCT.md).
