require 'json'

class CardsParseService
  attr_reader :content
  def initialize(content)
    @content = content
  end

  def parse_content
    parsed_content = eval(@content)
    if parsed_content["keywords"].present?
      return [parsed_content["keywords"], parsed_content["phrases"]]
    elsif parsed_content[:keywords].present?
      return [parsed_content[:keywords], parsed_content[:phrases]]
    else
      raise
    end
  end
end
