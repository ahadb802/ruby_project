require 'json'

class HandleData
  def initialize(filename)
    @filename = "./data/#{filename}.json"
  end

  def read
    data = File.read(@filename)
    JSON.parse(data)
  end

  def write(data)
    json = JSON.generate(data)
    File.write(@filename, json)
  end

  def file_exist
    File.exist?(@filename)
  end

  def file_empty
    File.empty?(@filename)
  end

  def not_exist_create_new
    File.new(@filename, 'w') unless file_exist
  end
end
