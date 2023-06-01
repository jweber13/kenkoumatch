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
    array = @content.split("\n").map { |line| line.split(" - ") }
    array_without_counters = array.map { |sub_array| sub_array.map { |element| element.gsub(/^\d+\.\s+/, "") } }
    return array_without_counters
  end

  def keys_english(input)
    input.map { |sub_array| sub_array[1] }.join(",")
  end

  def parse_content_keys(content)
    keys = JSON.parse(content)
    keys.each do |wrd|
      wrd.insert(1, " ") if wrd.length != 3
    end
  end

  def parse_content_phrases(content)
    arr = JSON.parse(content.gsub("- ", ""))

    return arr if arr.all? { |el| el.count == 3 }

    arr.map(&:join).reject(&:empty?).map do |el|
      if el.include?("？")
        el.split("？")
      elsif el.include?("!")
        el.split("!")
      else
        el.split("。")
      end
    end
  end
end
