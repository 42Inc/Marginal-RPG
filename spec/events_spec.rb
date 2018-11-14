require_relative "../lib/hero.rb"
require_relative "../lib/events.rb"
require_relative "../lib/engine.rb"
include Model
STDIN = File.open("./spec/io", "r")

describe Events do
  describe '.new' do
    context 'Go to the mines' do
      actions = Events.new
      #   ST: -30
      #   San: -2
      #   Cash: 300
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it {expect(subject.st).to eq 30}
      it {expect(subject.san).to eq 0}
      it {expect(subject.cash).to eq 500}
    end

    context 'Chill out on the lawn' do
      actions = Events.new
      #   MP: -10
      #   ST: 10
      #   San: 1
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it { expect(subject.mp).to eq 40 }
      it { expect(subject.st).to eq 40 }
      it { expect(subject.san).to eq 1 }
    end

    context 'Drink wine and watch anime' do
      actions = Events.new
      #   HP: -5
      #   MP: 30
      #   ST: 5
      #   San: -1
      #   Cash: -20
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it { expect(subject.hp).to eq 95 }
      it { expect(subject.mp).to eq 80 }
      it { expect(subject.st).to eq 35 }
      it { expect(subject.san).to eq -1 }
      it { expect(subject.cash).to eq 480 }
    end

    context 'Go to the ROOKS' do
      actions = Events.new
      #   HP: -10
      #   MP: 60
      #   ST: 40
      #   San: 1
      #   Cash: -100
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it { expect(subject.hp).to eq 90 }
      it { expect(subject.mp).to eq 100 }
      it { expect(subject.st).to eq 70 }
      it { expect(subject.san).to eq 1 }
      it { expect(subject.cash).to eq 400 }
    end

    context 'Get drunk with anime bois' do
      actions = Events.new
      #   HP: -30
      #   MP: 90
      #   ST: 60
      #   San: 3
      #   Cash: -200
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it {expect(subject.hp).to eq 70}
      it {expect(subject.mp).to eq 100}
      it {expect(subject.st).to eq 90}
      it {expect(subject.san).to eq 3}
      it {expect(subject.cash).to eq 300 }
    end

    context 'Have some sleep' do
      actions = Events.new
      #   HP: 90
      #   San: -3
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it { expect(subject.hp).to eq 100 }
      it { expect(subject.san).to eq -3}
    end

    context 'Go to the gachi-gym' do
      actions = Events.new
      #   HP: 20
      #   ST: -30
      #   San: 5
      #   Cash: -100
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it { expect(subject.hp).to eq 100 }
      it { expect(subject.st).to eq 30 }
      it { expect(subject.san).to eq 0 }
      it { expect(subject.cash).to eq 500 }
    end

    context 'Visit Navalny rally' do
      actions = Events.new
      #   HP: -40
      #   MP: 10
      #   ST: -10
      #   San: 3
      #   Cash: -100
      subject = HeroMarine.new(1)
      actions.get_event_for_hero(subject)

      it { expect(subject.hp).to eq 60 }
      it { expect(subject.mp).to eq 60 }
      it { expect(subject.st).to eq 20 }
      it { expect(subject.san).to eq 3 }
      it { expect(subject.cash).to eq 400 }
    end
  end
end
