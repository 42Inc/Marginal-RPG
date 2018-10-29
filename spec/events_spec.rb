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

  it "Drink wine and watch anime" do
    #   HP: -5
    #   MP: 30
    #   ST: 5
    #   San: -1
    #   Cash: -20
    stats = HeroMarine.new(1)
    stats.hp = 100
    stats.mp = 50
    stats.st = 30
    stats.san = 0
    stats.cash = 500

    actions.get_event_for_hero(stats)

    expect(95).to eq stats.hp
    expect(80).to eq stats.mp
    expect(35).to eq stats.st
    expect(-1).to eq stats.san
    expect(480).to eq stats.cash
  end

  it "Go to the ROOKS" do
    #   HP: -10
    #   MP: 60
    #   ST: 40
    #   San: 1
    #   Cash: -100
    stats = HeroMarine.new(1)
    stats.hp = 100
    stats.mp = 50
    stats.st = 30
    stats.san = 0
    stats.cash = 500

    actions.get_event_for_hero(stats)

    expect(90).to eq stats.hp
    expect(100).to eq stats.mp
    expect(70).to eq stats.st
    expect(1).to eq stats.san
    expect(400).to eq stats.cash
  end

  it "Get drunk with anime bois" do
    #   HP: -30
    #   MP: 90
    #   ST: 60
    #   San: 3
    #   Cash: -200
    stats = HeroMarine.new(1)
    stats.hp = 100
    stats.mp = 50
    stats.st = 30
    stats.san = 0
    stats.cash = 500

    actions.get_event_for_hero(stats)

    expect(70).to eq stats.hp
    expect(100).to eq stats.mp
    expect(90).to eq stats.st
    expect(3).to eq stats.san
    expect(300).to eq stats.cash
  end

  it "Have some sleep" do
    #   HP: 90
    #   San: -3
    stats = HeroMarine.new(1)
    stats.hp = 100
    stats.san = 0

    actions.get_event_for_hero(stats)

    expect(100).to eq stats.hp
    expect(-3).to eq stats.san
  end

  it "Go to the gachi-gym" do
    #   HP: 20
    #   ST: -30
    #   San: 5
    #   Cash: -100
    stats = HeroMarine.new(1)
    stats.hp = 100
    stats.st = 30
    stats.san = 0
    stats.cash = 500

    actions.get_event_for_hero(stats)

    expect(100).to eq stats.hp
    expect(30).to eq stats.st
    expect(0).to eq stats.san
    expect(500).to eq stats.cash
  end

  it "Visit Navalny's rally" do
    #   HP: -40
    #   MP: 10
    #   ST: -10
    #   San: 3
    #   Cash: -100
    stats = HeroMarine.new(1)
    stats.hp = 100
    stats.mp = 50
    stats.st = 30
    stats.san = 0
    stats.cash = 500


    actions.get_event_for_hero(stats)

    expect(60).to eq stats.hp
    expect(60).to eq stats.mp
    expect(20).to eq stats.st
    expect(3).to eq stats.san
    expect(400).to eq stats.cash
  end
end
