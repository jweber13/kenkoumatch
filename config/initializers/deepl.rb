DeepL.configure do |config|
  config.auth_key = ENV.fetch("DEEPL_AUTH_KEY")
  config.host = 'https://api-free.deepl.com' # Default value is 'https://api.deepl.com'
end
