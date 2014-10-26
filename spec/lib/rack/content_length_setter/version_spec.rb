require "spec_helper"

describe Rack::ContentLengthSetter::VERSION do
  it "should be a string" do
    expect(Rack::ContentLengthSetter::VERSION).to be_kind_of(String)
  end
end
