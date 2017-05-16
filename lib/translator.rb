# require modules here
require "yaml"

def load_library(file_path)
  library = {"get_meaning" => {}, "get_emoticon" => {} }
  emoticons = YAML.load_file(file_path)
  emoticons.each do |meaning, array|
    english, japanese = array
    library["get_emoticon"][english] = japanese
    library["get_meaning"][japanese] = meaning
  end
  library
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  emoji = library["get_emoticon"][emoticon]
  if emoji
    emoji
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path, emoticon)
  library = load_library(file_path)
  emoji = library["get_meaning"][emoticon]
  if emoji
    emoji
  else
    "Sorry, that emoticon was not found"
  end
end
