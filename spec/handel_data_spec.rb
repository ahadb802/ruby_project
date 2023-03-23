require_relative '../src/handel_data'

describe HandleData do
  let(:filename) { 'test_data' }
  let(:handle_data) { HandleData.new(filename) }

  it 'returns the parsed JSON data when the file exists' do
    File.write("./data/#{filename}.json", JSON.generate({ 'key' => 'value' }))
    expect(handle_data.read).to eq({ 'key' => 'value' })
  end

  it 'writes the JSON data to the file' do
    File.delete("./data/#{filename}.json")
    handle_data.write({ 'key' => 'value' })
    expect(File.read("./data/#{filename}.json")).to eq(JSON.generate({ 'key' => 'value' }))
  end
end
