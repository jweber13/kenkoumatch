require 'json'

class CardsParseService
  attr_reader :content
  def initialize(content)
    @content = content
  end

  def parse_content
    parsed_content = eval(@content)
    return [parsed_content["keywords"], parsed_content["phrases"]]
  end
end
