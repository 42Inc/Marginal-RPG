require_relative "../lib/hero.rb"
require_relative "../lib/events.rb"
require_relative "../lib/engine.rb"
include Model
STDIN = File.open("./spec/test1", "r")

RSpec.describe HeroMarine do
  it "Create new hero" do
    stats = HeroMarine.new(1)
    #   HP: 100
    #   MP: 50
    #   ST: 30
    #   San: 0
    #   Cash: 500

    expect(100).to eq stats.hp
    expect(50).to eq stats.mp
    expect(30).to eq stats.st
    expect(0).to eq stats.san
    expect(500).to eq stats.cash
  end

  it "Create new hero" do
    stats = HeroMarine.new(2)
    #   HP: 50
    #   MP: 30
    #   ST: 60
    #   San: 5
    #   Cash: 200

    expect(50).to eq stats.hp
    expect(30).to eq stats.mp
    expect(60).to eq stats.st
    expect(5).to eq stats.san
    expect(200).to eq stats.cash
  end
end
