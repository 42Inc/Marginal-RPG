require 'yaml'

module Model
  class HeroMarine
    attr_accessor :hp, :mp, :st, :san, :cash

    def initialize(choice)
      case choice
        when 1
          #system 'clear'
          puts '[SYSTEM]  Starting new game...'
          create_new_hero('../cfg/stats.yml')
        when 2
          #system 'clear'
          puts '[SYSTEM]  Loading game...'
          load_hero('../saves/stats.yml')
        else
          #system 'clear'
          puts '[FAILED]  Input error!'
      end
    end

    def create_new_hero(file)
      states = YAML.load_file file
      states.each do |stat, value|
        curr_value = @hero.send(stat)
        @hero.send(stat + '=', value - curr_value)
      end
    end

    def load_hero(file)
      states = YAML.load_file file
      states.each do |stat, value|
        curr_value = @hero.send(stat)
        @hero.send(stat + '=', value - curr_value)
      end
    end
  end
  puts 'Starting smth...'
  stream = HeroMarine.new(gets.chomp.to_i)
end
