require 'json'

class CardsParseService
  attr_reader :content

  def initialize(content = nil)
    @content = content
  end

  def update(content)
    @content = content
  end

  def parse_content
    # matches = @content.scan(/\{ '(.*?)' => '(.*?)' \}/)
    # parsed_array = matches.map { |match| { match[0] => match[1] } }
    # begin
    #   parsed_array = JSON.parse(@content)
    #   raise
    # rescue JSON::ParserError => e
    #   puts "Error parsing response: #{e.message}"
    #   parsed_array = eval(@content)
    #   raise
    # end
    # parsed_array = @content.split("\n")arr
    array = @content.split("\n").map { |line| line.split(" - ") }
    array_without_counters = array.map { |sub_array| sub_array.map { |element| element.gsub(/^\d+\.\s+/, "") } }
    return array_without_counters
  end

  def phrases_for_show
    # parsed_content = JSON.parse(@content)

  end

  def keys_english(input)
    input.map { |sub_array| sub_array[1] }.join(",")
  end

  def parse_content_show(content)
    JSON.parse(content)
  end
end
