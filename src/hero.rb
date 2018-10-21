require 'yaml'

module Model
  class HeroMarine
    attr_reader :name
    attr_accessor :hp, :mp, :st, :san, :cash

    def initialize(choice)
      case choice
        when 1
#          system 'clear'
          puts '[SYSTEM]  Starting new game...'
          create_new_hero('cfg/stats.yml')
        when 2
#          system 'clear'
          puts '[SYSTEM]  Loading game...'
          load_hero('saves/stats.yml')
        else
#          system 'clear'
          puts '[FAILED]  Input error!'
      end
    end

    def create_new_hero(file)
      states = YAML.load_file(file)
      @hp = states[0]["HP"]
      @mp = states[0]["MP"]
      @st = states[0]["ST"]
      @san = states[0]["San"]
      @cash = states[0]["Cash"]
      puts '[SYSTEM]  Created new hero:'
      puts 'Marginal Valera'
      printf("HP:\t%s\n", @hp)
      printf("MP:\t%s\n", @mp)
      printf("ST:\t%s\n", @st)
      printf("San:\t%s\n", @san)
      printf("Cash:\t%s\n", @cash)
    end

    def load_hero(file)
      states = YAML.load_file(file)
      @hp = states[0]["HP"]
      @mp = states[0]["MP"]
      @st = states[0]["ST"]
      @san = states[0]["San"]
      @cash = states[0]["Cash"]
      puts '[SYSTEM]  Loaded existing hero:'
      puts 'Marginal Valera'
      printf("HP:\t%s\n", @hp)
      printf("MP:\t%s\n", @mp)
      printf("ST:\t%s\n", @st)
      printf("San:\t%s\n", @san)
      printf("Cash:\t%s\n", @cash)
    end
  end
#  system 'clear'
  printf("[SYSTEM]  Starting engine...\n")
  printf("[SYSTEM]  Loading events...\n")
  printf("[SYSTEM]  Triggering events...\n")
#  stream = HeroMarine.new(gets.chomp.to_i)
end
