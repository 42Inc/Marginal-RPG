require_relative "../lib/hero.rb"
require_relative "../lib/events.rb"
require_relative "../lib/engine.rb"
include Model
STDIN = File.open("./spec/test1", "r")

describe HeroMarine do
  describe '.new' do
    context 'Create new hero' do
      subject {HeroMarine.new(1)}
      #   HP: 100
      #   MP: 50
      #   ST: 30
      #   San: 0
      #   Cash: 500

      it {expect(subject.hp).to eq 100 }
      it {expect(subject.mp).to eq 50 }
      it {expect(subject.st).to eq 30 }
      it {expect(subject.san).to eq 0 }
      it {expect(subject.cash).to eq 500 }
    end

    context 'Load existing hero' do
      subject {HeroMarine.new(2)}
      #   HP: 100
      #   MP: 50
      #   ST: 30
      #   San: 0
      #   Cash: 500

      it {expect(subject.hp).to eq 50 }
      it {expect(subject.mp).to eq 30 }
      it {expect(subject.st).to eq 60 }
      it {expect(subject.san).to eq 5 }
      it {expect(subject.cash).to eq 200 }
    end
  end
end
