class ChatGptService
  include HTTParty

  attr_reader :options

  def initialize(api_key, model = 'gpt-3.5-turbo')
    @options = {
      headers: {
        'Content-Type': 'application/json',
        'Authorization': "Bearer #{api_key}"
      },
      api_url: 'https://api.openai.com/v1/chat/completions',
      model: model
    }
  end

  def translate(message, languages)
    message = set_messsage_for_translation(message, languages)
    body = {
      model: options[:model],
      messages: [{ role: 'user', content: message }]
    }
    begin
      response = HTTParty.post(options[:api_url], body: body.to_json, headers: options[:headers], timeout: 10)
      response['choices'][0]['message']['content']
    rescue Exception => e
      "Chat gpt sent an invalid response #{e.message}"
    end
  end

  private

  def set_messsage_for_translation(message, languages)
    message = if message.is_a? String
                "Translate this #{message} into these languages #{languages}"
              else
                file_data = YAML.load(File.read(message.path))
                "Translate only the values after the colon sign, in string into these languages #{languages} and return response in the standard .yml format #{file_data}"
              end
    message
  end
end
