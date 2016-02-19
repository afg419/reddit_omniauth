require 'rails_helper'

RSpec.describe Cache, type: :model do
  it "can hold hashes" do
    cache = Cache.create(top: {a: "hey"})
    expect(cache.top).to eq({a: "hey"})
  end
end
