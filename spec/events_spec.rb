require_relative "../lib/hero.rb"
require_relative "../lib/events.rb"
require_relative "../lib/engine.rb"
include Model

RSpec.describe Events do
  actions = Events.new

  it "Go to the mines" do
    #   ST: -30
    #   San: -2
    #   Cash: 300
    stats = HeroMarine.new(1)
    stats.st = 30
    stats.san = 0
    stats.cash = 500

    actions.get_event_for_hero(stats)

    expect(30).to eq stats.st
    expect(0).to eq stats.san
    expect(500).to eq stats.cash
  end

  it "Chill out on the lawn" do
    #   MP: -10
    #   ST: 10
    #   San: 1
    stats = HeroMarine.new(1)
    stats.mp = 50
    stats.st = 30
    stats.san = 0

    actions.get_event_for_hero(stats)

    expect(40).to eq stats.mp
    expect(40).to eq stats.st
    expect(1).to eq stats.san
  end
end
