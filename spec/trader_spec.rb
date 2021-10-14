require_relative '../lib/trader'

describe "open url, takes a url, return the html" do
  it "TEST empty url" do
    expect(open_url("")).to eq(nil)
  end
  it "TEST good url" do
    expect(open_url("https://www.google.com/")).to be_kind_of(Nokogiri::HTML::Document)
  end
end