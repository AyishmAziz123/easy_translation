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

  def translate(message)
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
end
