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

  def keys_english(input)
    input.map { |sub_array| sub_array[1] }.join(",")
  end

  def parse_content_keys(content)
    keys = JSON.parse(content)
    # return keys.map { |el| el.join.split("-") }
    # keys = JSON.parse(content).map do |key|
    #   split_list = key.map do |item|
    #     # raise
    #     if item.include?(" (")
    #       japanese, romaji = item.split(" (")
    #       english = key[1]
    #       [japanese, romaji, english]
    #     else
    #       [item]
    #     end
    #   end.flatten
    #   split_list.pop
    #   split_list
    #   raise
    # end
  end

  def parse_content_phrases(content)
    arr = JSON.parse(content)
    # raise
    unless arr.all? { |el| el.count == 3 }
    # string_arr = arr.map(&:join)
      return arr.map(&:join).map do |el|
        if el.include?("？")
          el.split("？")
        elsif el.include?("!")
          el.split("!")
        else
          el.split("。")
        end
      end
    end
    return arr
  end
end
